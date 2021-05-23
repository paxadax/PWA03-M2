import {Entity, model, property} from '@loopback/repository';

@model()
export class ClienteEncomenda extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'number',
  })
  clienteId?: number;

  @property({
    type: 'number',
  })
  encomendaId?: number;

  constructor(data?: Partial<ClienteEncomenda>) {
    super(data);
  }
}

export interface ClienteEncomendaRelations {
  // describe navigational properties here
}

export type ClienteEncomendaWithRelations = ClienteEncomenda & ClienteEncomendaRelations;
