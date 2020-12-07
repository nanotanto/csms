<?php

namespace App\Http\Controllers;
use App\Perusahaan;
use Illuminate\Http\Request;

class PerusahaanController extends Controller
{
    public function index(){
        $data = Perusahaan::all();
        return response()->json($data);
    }

    public function show($id){
        $data = Perusahaan::where("id",$id)->get();
        return response()->json($data);
    }

    public function save(Request $request)
    {
        Perusahaan::create($request->all());
    }
}
