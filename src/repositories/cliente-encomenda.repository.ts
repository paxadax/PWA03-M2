import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {DbDataSource} from '../datasources';
import {ClienteEncomenda, ClienteEncomendaRelations} from '../models';

export class ClienteEncomendaRepository extends DefaultCrudRepository<
  ClienteEncomenda,
  typeof ClienteEncomenda.prototype.id,
  ClienteEncomendaRelations
> {
  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
  ) {
    super(ClienteEncomenda, dataSource);
  }
}
