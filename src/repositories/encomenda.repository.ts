import {inject, Getter} from '@loopback/core';
import {DefaultCrudRepository, repository, HasManyThroughRepositoryFactory} from '@loopback/repository';
import {DbDataSource} from '../datasources';
import {Encomenda, EncomendaRelations, Produto, EncomendaProduto} from '../models';
import {EncomendaProdutoRepository} from './encomenda-produto.repository';
import {ProdutoRepository} from './produto.repository';

export class EncomendaRepository extends DefaultCrudRepository<
  Encomenda,
  typeof Encomenda.prototype.id,
  EncomendaRelations
> {

  public readonly produtos: HasManyThroughRepositoryFactory<Produto, typeof Produto.prototype.id,
          EncomendaProduto,
          typeof Encomenda.prototype.id
        >;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource, @repository.getter('EncomendaProdutoRepository') protected encomendaProdutoRepositoryGetter: Getter<EncomendaProdutoRepository>, @repository.getter('ProdutoRepository') protected produtoRepositoryGetter: Getter<ProdutoRepository>,
  ) {
    super(Encomenda, dataSource);
    this.produtos = this.createHasManyThroughRepositoryFactoryFor('produtos', produtoRepositoryGetter, encomendaProdutoRepositoryGetter,);
    this.registerInclusionResolver('produtos', this.produtos.inclusionResolver);
  }
}
