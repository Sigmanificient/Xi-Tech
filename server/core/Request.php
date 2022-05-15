<?php

namespace Xi\core;

class Request
{
    public static function getPath()
    {
        $uriParts = explode('/', $_SERVER['REQUEST_URI']);
        array_shift($uriParts);
        return $uriParts;
    }

    public static function getMethod(): string
    {
        return strtolower($_SERVER['REQUEST_METHOD']);
    }

    public static function getParams(): array
    {
        $_SESSION['post'] = $_POST;
        $_SESSION['get'] = $_GET;
        $_SESSION['input'] = file_get_contents("php://input");

        if (self::getMethod() === 'get') {
            return $_GET ?? [];
        }

        return json_decode(
                file_get_contents("php://input"), true
            ) ?? [];
    }
}
