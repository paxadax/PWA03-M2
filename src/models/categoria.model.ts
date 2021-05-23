import {Entity, model, property, hasMany} from '@loopback/repository';
import {Produto} from './produto.model';
import {CategoriaProduto} from './categoria-produto.model';

@model()
export class Categoria extends Entity {
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
  tipo: string;

  @hasMany(() => Produto, {through: {model: () => CategoriaProduto}})
  produtos: Produto[];

  constructor(data?: Partial<Categoria>) {
    super(data);
  }
}

export interface CategoriaRelations {
  // describe navigational properties here
}

export type CategoriaWithRelations = Categoria & CategoriaRelations;
