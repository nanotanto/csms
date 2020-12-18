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
    return $router->app->version();
});

$router->get('/key', function() {
    return \Illuminate\Support\Str::random(32);
});

$router->get('perusahaan_baru', 'PerusahaanController@indexNew');
$router->get('perusahaan', 'PerusahaanController@index');
$router->get('perusahaan/show/{id}', 'PerusahaanController@show');
$router->post('perusahaan/save', 'PerusahaanController@save');
$router->put('perusahaan/save/{id}', 'PerusahaanController@update');
$router->post('perusahaan/delete/{id}', 'PerusahaanController@delete');

$router->get('penilaian_baru', 'PenilaianController@indexNew');
$router->get('penilaian', 'PenilaianController@index');
$router->get('penilaian/show/{id}', 'PenilaianController@show');
$router->post('penilaian/save', 'PenilaianController@save');
$router->put('penilaian/save/{id}', 'PenilaianController@update');
$router->post('penilaian/delete/{id}', 'PenilaianController@delete');

$router->get('bukti_baru', 'BuktiController@indexNew');
$router->get('bukti', 'BuktiController@index');
$router->get('bukti/show/{id}', 'BuktiController@show');
$router->post('bukti/save', 'BuktiController@save');
$router->put('bukti/save/{id}', 'BuktiController@update');
$router->post('bukti/delete/{id}', 'BuktiController@delete');