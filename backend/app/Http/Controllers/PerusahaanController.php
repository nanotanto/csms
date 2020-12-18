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
    
    public function indexNew(){
        $data = Perusahaan::orderBy('id','desc')->first();
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

    public function update(Request $request, $id){
        $data = Perusahaan::findOrFail($id);
        $data->fill($request->all());
        $data->save();
    }

    public function newData(){
        $data = Perusahaan::latest()->first();
        return response()->json($data);
    }

    public function delete(Request $request, $id){
        $data = Perusahaan::find($id);
        $data->delete();
    }
}
