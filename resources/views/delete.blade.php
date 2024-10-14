@extends('layout')

@section('title', 'Delete Family')

@section('header', 'Confirm Family Deletion')

@section('content')
<div class="mb-6">
    <a href="{{ route('family.index') }}" 
       class="inline-block px-4 py-2 bg-gray-600 text-white text-sm font-medium rounded-md shadow hover:bg-gray-700 focus:outline-none mb-4">
       Voltar para a dashboard
    </a>
</div>

<div class="bg-white shadow overflow-hidden sm:rounded-lg p-6">
    <p class="text-xl font-semibold text-gray-700">Tem a certeza de que pretende exluir a família <span class="text-red-600">{{ $family->name }}</span> e seus respectivos membros?</p>

    <div class="mt-6 flex flex-col sm:flex-row sm:space-x-4">
        <form action="{{ route('family.destroy', $family->id) }}" method="POST" class="flex-1">
            @csrf
            @method('DELETE')
            <button type="submit" 
                class="w-full sm:w-auto px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-md shadow hover:bg-red-700 focus:outline-none">
                Sim, Deletar familia
            </button>
        </form>
        <a href="{{ route('family.index') }}" 
           class="w-full sm:w-auto px-4 py-2 bg-gray-600 text-white text-sm font-medium rounded-md shadow hover:bg-gray-700 focus:outline-none mt-4 sm:mt-0">
           Cancelar
        </a>
    </div>
</div>
@endsection
