abstract class GenericService<T> {
  T findOne(int id);
  List<T> findAll();
  bool save(T entity);
  bool delete(int id);
}
