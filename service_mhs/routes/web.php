<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return response()->json([
        'status' => 'success',
        'message' => 'Service Mahasiswa',
        'data' => [
            'app_version' => '1.0',
            'tec_info' => $router->app->version()
        ]
    ], 200);
});
