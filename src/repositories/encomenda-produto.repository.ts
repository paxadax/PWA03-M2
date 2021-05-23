import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {DbDataSource} from '../datasources';
import {EncomendaProduto, EncomendaProdutoRelations} from '../models';

export class EncomendaProdutoRepository extends DefaultCrudRepository<
  EncomendaProduto,
  typeof EncomendaProduto.prototype.id,
  EncomendaProdutoRelations
> {
  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
  ) {
    super(EncomendaProduto, dataSource);
  }
}
