<?php

namespace Xi\core;


class API
{
  public static function _notFound() {
    Response::status(404);
    Response::json(['error' => 'Not found']);
  }

  public static function _forbidden() {
    Response::status(403);
    Response::json(['error' => 'Forbidden']);
  }

  public static function dispatch() {
    $params = Request::getPath();
    array_shift($params);

    $endpointName = ucfirst(array_shift($params));
    $endpointPath = ROOT_PATH . '/api/' . $endpointName . '.php';

    if (!file_exists($endpointPath)) {
      self::_notFound();
      return;
    }

    require_once $endpointPath;
    $endpoint = new $endpointName();

    $method = Request::getMethod();
    $action = $method . ucfirst(array_shift($params));

    if (!method_exists($endpoint, $action)) {
      self::_notFound();
      return;
    }

    Response::status(200);
    Response::json($endpoint->$action() ?? []);
  }
}
