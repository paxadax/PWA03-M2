import {
  Count,
  CountSchema,
  Filter,
  repository,
  Where,
} from '@loopback/repository';
  import {
  del,
  get,
  getModelSchemaRef,
  getWhereSchemaFor,
  param,
  patch,
  post,
  requestBody,
} from '@loopback/rest';
import {
Categoria,
CategoriaProduto,
Produto,
} from '../models';
import {CategoriaRepository} from '../repositories';

export class CategoriaProdutoController {
  constructor(
    @repository(CategoriaRepository) protected categoriaRepository: CategoriaRepository,
  ) { }

  @get('/categorias/{id}/produtos', {
    responses: {
      '200': {
        description: 'Array of Categoria has many Produto through CategoriaProduto',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Produto)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Produto>,
  ): Promise<Produto[]> {
    return this.categoriaRepository.produtos(id).find(filter);
  }

  @post('/categorias/{id}/produtos', {
    responses: {
      '200': {
        description: 'create a Produto model instance',
        content: {'application/json': {schema: getModelSchemaRef(Produto)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof Categoria.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Produto, {
            title: 'NewProdutoInCategoria',
            exclude: ['id'],
          }),
        },
      },
    }) produto: Omit<Produto, 'id'>,
  ): Promise<Produto> {
    return this.categoriaRepository.produtos(id).create(produto);
  }

  @patch('/categorias/{id}/produtos', {
    responses: {
      '200': {
        description: 'Categoria.Produto PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Produto, {partial: true}),
        },
      },
    })
    produto: Partial<Produto>,
    @param.query.object('where', getWhereSchemaFor(Produto)) where?: Where<Produto>,
  ): Promise<Count> {
    return this.categoriaRepository.produtos(id).patch(produto, where);
  }

  @del('/categorias/{id}/produtos', {
    responses: {
      '200': {
        description: 'Categoria.Produto DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Produto)) where?: Where<Produto>,
  ): Promise<Count> {
    return this.categoriaRepository.produtos(id).delete(where);
  }
}
