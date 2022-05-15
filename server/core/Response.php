<?php

namespace Xi\core;

class Response
{
    public static function json(array $data)
    {
        header('Content-Type: application/json');
        echo json_encode($data);
    }

    public static function status(int $code)
    {
        http_response_code($code);
    }

    public static function put(string $string)
    {
        echo file_get_contents($string);
    }

    public static function redirect(string $url)
    {
        http_response_code(302);
        header('Location: ' . $url);
    }
}
