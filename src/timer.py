import timeit


def timer(function):
  def new_function(*args):
    start_time = timeit.default_timer()
    function(*args)
    elapsed = timeit.default_timer() - start_time
    print('Function "{name}" took {time} seconds to complete.'.format(name=function.__name__, time=elapsed))
  return new_function