<?php

namespace Xi\core\base;


/**
 * Singleton class
 * - Implementation of Singleton pattern
 * - Singleton is a class that has only one instance
 * - See: https://www.patterns.dev/posts/singleton-pattern/
 */
abstract class Singleton
{
  private static array $_instances = [];

  /**
   * @return static
   * - Returns the instance of the class
   */
  public static function Instance(): self
  {
    $class = get_called_class();

    if (!isset(self::$_instances[$class]))
      self::$_instances[$class] = new $class();

    return self::$_instances[$class];
  }
}
