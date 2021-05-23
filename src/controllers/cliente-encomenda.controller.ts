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
Cliente,
ClienteEncomenda,
Encomenda,
} from '../models';
import {ClienteRepository} from '../repositories';

export class ClienteEncomendaController {
  constructor(
    @repository(ClienteRepository) protected clienteRepository: ClienteRepository,
  ) { }

  @get('/clientes/{id}/encomendas', {
    responses: {
      '200': {
        description: 'Array of Cliente has many Encomenda through ClienteEncomenda',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Encomenda)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Encomenda>,
  ): Promise<Encomenda[]> {
    return this.clienteRepository.encomendas(id).find(filter);
  }

  @post('/clientes/{id}/encomendas', {
    responses: {
      '200': {
        description: 'create a Encomenda model instance',
        content: {'application/json': {schema: getModelSchemaRef(Encomenda)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof Cliente.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Encomenda, {
            title: 'NewEncomendaInCliente',
            exclude: ['id'],
          }),
        },
      },
    }) encomenda: Omit<Encomenda, 'id'>,
  ): Promise<Encomenda> {
    return this.clienteRepository.encomendas(id).create(encomenda);
  }

  @patch('/clientes/{id}/encomendas', {
    responses: {
      '200': {
        description: 'Cliente.Encomenda PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Encomenda, {partial: true}),
        },
      },
    })
    encomenda: Partial<Encomenda>,
    @param.query.object('where', getWhereSchemaFor(Encomenda)) where?: Where<Encomenda>,
  ): Promise<Count> {
    return this.clienteRepository.encomendas(id).patch(encomenda, where);
  }

  @del('/clientes/{id}/encomendas', {
    responses: {
      '200': {
        description: 'Cliente.Encomenda DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Encomenda)) where?: Where<Encomenda>,
  ): Promise<Count> {
    return this.clienteRepository.encomendas(id).delete(where);
  }
}
