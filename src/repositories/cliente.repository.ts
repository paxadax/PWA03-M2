import {inject, Getter} from '@loopback/core';
import {DefaultCrudRepository, repository, HasManyThroughRepositoryFactory} from '@loopback/repository';
import {DbDataSource} from '../datasources';
import {Cliente, ClienteRelations, Encomenda, ClienteEncomenda} from '../models';
import {ClienteEncomendaRepository} from './cliente-encomenda.repository';
import {EncomendaRepository} from './encomenda.repository';

export class ClienteRepository extends DefaultCrudRepository<
  Cliente,
  typeof Cliente.prototype.id,
  ClienteRelations
> {

  public readonly encomendas: HasManyThroughRepositoryFactory<Encomenda, typeof Encomenda.prototype.id,
          ClienteEncomenda,
          typeof Cliente.prototype.id
        >;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource, @repository.getter('ClienteEncomendaRepository') protected clienteEncomendaRepositoryGetter: Getter<ClienteEncomendaRepository>, @repository.getter('EncomendaRepository') protected encomendaRepositoryGetter: Getter<EncomendaRepository>,
  ) {
    super(Cliente, dataSource);
    this.encomendas = this.createHasManyThroughRepositoryFactoryFor('encomendas', encomendaRepositoryGetter, clienteEncomendaRepositoryGetter,);
    this.registerInclusionResolver('encomendas', this.encomendas.inclusionResolver);
  }
}
