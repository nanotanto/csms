<?php

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
    //return $router->app->version();
    return view('index');
});

$router->get('/key', function() {
    return \Illuminate\Support\Str::random(32);
});

$router->get('perusahaan', 'PerusahaanController@index');
$router->get('perusahaan/newData', 'PerusahaanController@newData');
$router->get('perusahaan/show/{id}', 'PerusahaanController@show');
$router->post('perusahaan/save', 'PerusahaanController@save');
$router->put('perusahaan/save/{id}', 'PerusahaanController@update');
$router->post('perusahaan/delete/{id}', 'PerusahaanController@delete');


$router->get('evaluasi', 'EvaluasiController@index');
$router->get('evaluasi/show/{id}', 'EvaluasiController@show');
$router->post('evaluasi/save', 'EvaluasiController@save');
$router->put('evaluasi/save/{id}', 'EvaluasiController@update');
$router->post('evaluasi/delete/{id}', 'EvaluasiController@delete');