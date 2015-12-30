package homework.sample.controller;

@FunctionalInterface
public interface IAddable<T> {
    // To add two objects
    public T add(T t1, T t2);
}
