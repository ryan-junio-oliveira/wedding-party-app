@extends('layoutDashboard')

@section('title', 'Dashboard')

@section('header', 'Dashboard - WeddingApp')

@section('content')
<div class="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3">
    <div class="bg-gray-800 text-white p-4 rounded-lg shadow">
        <h3 class="text-lg font-bold">Produto A</h3>
        <p class="text-2xl">R$ 523.000</p>
    </div>
    <div class="bg-gray-800 text-white p-4 rounded-lg shadow">
        <h3 class="text-lg font-bold">Produto B</h3>
        <p class="text-2xl">R$ 808.000</p>
    </div>
    <div class="bg-gray-800 text-white p-4 rounded-lg shadow">
        <h3 class="text-lg font-bold">Produto C</h3>
        <p class="text-2xl">R$ 1.012.000</p>
    </div>
</div>

<!-- Script para gerar gráfico -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
@endsection
