import {Entity, model, property, hasMany} from '@loopback/repository';
import {Produto} from './produto.model';
import {EncomendaProduto} from './encomenda-produto.model';

@model()
export class Encomenda extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'number',
    required: true,
  })
  clienteId: number;

  @property({
    type: 'number',
    required: true,
  })
  produtoId: number;

  @property({
    type: 'number',
    required: true,
  })
  quantidade: number;

  @property({
    type: 'number',
    required: true,
  })
  total: number;

  @hasMany(() => Produto, {through: {model: () => EncomendaProduto}})
  produtos: Produto[];

  constructor(data?: Partial<Encomenda>) {
    super(data);
  }
}

export interface EncomendaRelations {
  // describe navigational properties here
}

export type EncomendaWithRelations = Encomenda & EncomendaRelations;
