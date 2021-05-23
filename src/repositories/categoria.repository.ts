import {inject, Getter} from '@loopback/core';
import {DefaultCrudRepository, repository, HasManyThroughRepositoryFactory} from '@loopback/repository';
import {DbDataSource} from '../datasources';
import {Categoria, CategoriaRelations, Produto, CategoriaProduto} from '../models';
import {CategoriaProdutoRepository} from './categoria-produto.repository';
import {ProdutoRepository} from './produto.repository';

export class CategoriaRepository extends DefaultCrudRepository<
  Categoria,
  typeof Categoria.prototype.id,
  CategoriaRelations
> {

  public readonly produtos: HasManyThroughRepositoryFactory<Produto, typeof Produto.prototype.id,
          CategoriaProduto,
          typeof Categoria.prototype.id
        >;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource, @repository.getter('CategoriaProdutoRepository') protected categoriaProdutoRepositoryGetter: Getter<CategoriaProdutoRepository>, @repository.getter('ProdutoRepository') protected produtoRepositoryGetter: Getter<ProdutoRepository>,
  ) {
    super(Categoria, dataSource);
    this.produtos = this.createHasManyThroughRepositoryFactoryFor('produtos', produtoRepositoryGetter, categoriaProdutoRepositoryGetter,);
    this.registerInclusionResolver('produtos', this.produtos.inclusionResolver);
  }
}
