import {Entity, model, property} from '@loopback/repository';

@model()
export class CategoriaProduto extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'number',
  })
  categoriaId?: number;

  @property({
    type: 'number',
  })
  produtoId?: number;

  constructor(data?: Partial<CategoriaProduto>) {
    super(data);
  }
}

export interface CategoriaProdutoRelations {
  // describe navigational properties here
}

export type CategoriaProdutoWithRelations = CategoriaProduto & CategoriaProdutoRelations;
