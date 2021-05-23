import {inject, Getter} from '@loopback/core';
import {DefaultCrudRepository, repository, HasManyRepositoryFactory} from '@loopback/repository';
import {DbDataSource} from '../datasources';
import {Produto, ProdutoRelations, Stock} from '../models';
import {StockRepository} from './stock.repository';

export class ProdutoRepository extends DefaultCrudRepository<
  Produto,
  typeof Produto.prototype.id,
  ProdutoRelations
> {

  public readonly stocks: HasManyRepositoryFactory<Stock, typeof Produto.prototype.id>;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource, @repository.getter('StockRepository') protected stockRepositoryGetter: Getter<StockRepository>,
  ) {
    super(Produto, dataSource);
    this.stocks = this.createHasManyRepositoryFactoryFor('stocks', stockRepositoryGetter,);
    this.registerInclusionResolver('stocks', this.stocks.inclusionResolver);
  }
}
