import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {DbDataSource} from '../datasources';
import {CategoriaProduto, CategoriaProdutoRelations} from '../models';

export class CategoriaProdutoRepository extends DefaultCrudRepository<
  CategoriaProduto,
  typeof CategoriaProduto.prototype.id,
  CategoriaProdutoRelations
> {
  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
  ) {
    super(CategoriaProduto, dataSource);
  }
}
