import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where,
} from '@loopback/repository';
import {
  post,
  param,
  get,
  getModelSchemaRef,
  patch,
  put,
  del,
  requestBody,
  response,
} from '@loopback/rest';
import {Encomenda} from '../models';
import {EncomendaRepository} from '../repositories';

export class EncomendaController {
  constructor(
    @repository(EncomendaRepository)
    public encomendaRepository : EncomendaRepository,
  ) {}

  @post('/encomendas')
  @response(200, {
    description: 'Encomenda model instance',
    content: {'application/json': {schema: getModelSchemaRef(Encomenda)}},
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Encomenda, {
            title: 'NewEncomenda',
            exclude: ['id'],
          }),
        },
      },
    })
    encomenda: Omit<Encomenda, 'id'>,
  ): Promise<Encomenda> {
    return this.encomendaRepository.create(encomenda);
  }

  @get('/encomendas/count')
  @response(200, {
    description: 'Encomenda model count',
    content: {'application/json': {schema: CountSchema}},
  })
  async count(
    @param.where(Encomenda) where?: Where<Encomenda>,
  ): Promise<Count> {
    return this.encomendaRepository.count(where);
  }

  @get('/encomendas')
  @response(200, {
    description: 'Array of Encomenda model instances',
    content: {
      'application/json': {
        schema: {
          type: 'array',
          items: getModelSchemaRef(Encomenda, {includeRelations: true}),
        },
      },
    },
  })
  async find(
    @param.filter(Encomenda) filter?: Filter<Encomenda>,
  ): Promise<Encomenda[]> {
    return this.encomendaRepository.find(filter);
  }

  @patch('/encomendas')
  @response(200, {
    description: 'Encomenda PATCH success count',
    content: {'application/json': {schema: CountSchema}},
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Encomenda, {partial: true}),
        },
      },
    })
    encomenda: Encomenda,
    @param.where(Encomenda) where?: Where<Encomenda>,
  ): Promise<Count> {
    return this.encomendaRepository.updateAll(encomenda, where);
  }

  @get('/encomendas/{id}')
  @response(200, {
    description: 'Encomenda model instance',
    content: {
      'application/json': {
        schema: getModelSchemaRef(Encomenda, {includeRelations: true}),
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Encomenda, {exclude: 'where'}) filter?: FilterExcludingWhere<Encomenda>
  ): Promise<Encomenda> {
    return this.encomendaRepository.findById(id, filter);
  }

  @patch('/encomendas/{id}')
  @response(204, {
    description: 'Encomenda PATCH success',
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Encomenda, {partial: true}),
        },
      },
    })
    encomenda: Encomenda,
  ): Promise<void> {
    await this.encomendaRepository.updateById(id, encomenda);
  }

  @put('/encomendas/{id}')
  @response(204, {
    description: 'Encomenda PUT success',
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() encomenda: Encomenda,
  ): Promise<void> {
    await this.encomendaRepository.replaceById(id, encomenda);
  }

  @del('/encomendas/{id}')
  @response(204, {
    description: 'Encomenda DELETE success',
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.encomendaRepository.deleteById(id);
  }
}
