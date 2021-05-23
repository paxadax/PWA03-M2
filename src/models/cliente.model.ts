import {Entity, model, property, hasMany} from '@loopback/repository';
import {Encomenda} from './encomenda.model';
import {ClienteEncomenda} from './cliente-encomenda.model';

@model()
export class Cliente extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
    required: true,
  })
  nome: string;

  @property({
    type: 'string',
    required: true,
  })
  dataNasc: string;

  @property({
    type: 'number',
    required: true,
  })
  nif: number;

  @property({
    type: 'string',
    required: true,
  })
  morada: string;

  @hasMany(() => Encomenda, {through: {model: () => ClienteEncomenda}})
  encomendas: Encomenda[];

  constructor(data?: Partial<Cliente>) {
    super(data);
  }
}

export interface ClienteRelations {
  // describe navigational properties here
}

export type ClienteWithRelations = Cliente & ClienteRelations;
