import {Entity, model, property} from '@loopback/repository';

@model()
export class EncomendaProduto extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'number',
  })
  encomendaId?: number;

  @property({
    type: 'number',
  })
  produtoId?: number;

  constructor(data?: Partial<EncomendaProduto>) {
    super(data);
  }
}

export interface EncomendaProdutoRelations {
  // describe navigational properties here
}

export type EncomendaProdutoWithRelations = EncomendaProduto & EncomendaProdutoRelations;
