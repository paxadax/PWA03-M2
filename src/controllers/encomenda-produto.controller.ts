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
Encomenda,
EncomendaProduto,
Produto,
} from '../models';
import {EncomendaRepository} from '../repositories';

export class EncomendaProdutoController {
  constructor(
    @repository(EncomendaRepository) protected encomendaRepository: EncomendaRepository,
  ) { }

  @get('/encomendas/{id}/produtos', {
    responses: {
      '200': {
        description: 'Array of Encomenda has many Produto through EncomendaProduto',
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
    return this.encomendaRepository.produtos(id).find(filter);
  }

  @post('/encomendas/{id}/produtos', {
    responses: {
      '200': {
        description: 'create a Produto model instance',
        content: {'application/json': {schema: getModelSchemaRef(Produto)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof Encomenda.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Produto, {
            title: 'NewProdutoInEncomenda',
            exclude: ['id'],
          }),
        },
      },
    }) produto: Omit<Produto, 'id'>,
  ): Promise<Produto> {
    return this.encomendaRepository.produtos(id).create(produto);
  }

  @patch('/encomendas/{id}/produtos', {
    responses: {
      '200': {
        description: 'Encomenda.Produto PATCH success count',
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
    return this.encomendaRepository.produtos(id).patch(produto, where);
  }

  @del('/encomendas/{id}/produtos', {
    responses: {
      '200': {
        description: 'Encomenda.Produto DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Produto)) where?: Where<Produto>,
  ): Promise<Count> {
    return this.encomendaRepository.produtos(id).delete(where);
  }
}
