@extends('layout')

@section('title', 'Dashboard')

@section('header', 'Dashboard - WeddingApp')

@section('content')
<div class="mb-6 space-y-4 sm:space-y-0 sm:space-x-4 sm:flex">
    <a href="{{ route('family.create') }}"
        class="inline-block px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-md shadow hover:bg-blue-700 focus:outline-none">
        Registrar nova familia
    </a>
    <a href="{{ route('family.export') }}" class="inline-block px-4 py-2 bg-green-600 text-white text-sm font-medium rounded-md shadow hover:bg-green-700 focus:outline-none">
        Exportar CSV
    </a>
    <a href="{{ route('family.export.pdf') }}" class="inline-block px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-md shadow hover:bg-red-700 focus:outline-none">
        Exportar PDF
    </a>
</div>

<div class="bg-white shadow overflow-hidden sm:rounded-lg p-6">
    <div class="mb-6">
        <p class="text-xl font-semibold text-gray-700">Total Familias: <span class="text-blue-600">{{ $totalfamily }}</span></p>
        <p class="text-xl font-semibold text-gray-700">Total Convidados: <span class="text-blue-600">{{ $totalGuests }}</span></p>
    </div>

    <div class="overflow-x-auto">
        <table class="min-w-full table-auto bg-white border border-gray-200">
            <thead class="bg-gray-50">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Familia</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Membros</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Acões</th>
                </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
                @foreach($family as $family)
                <tr>
                    <td class="px-6 py-4 whitespace-nowrap">{{ $family->name }}</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <ul class="list-disc ml-6">
                            @foreach($family->members as $member)
                            <li>{{ $member->name }}</li>
                            @endforeach
                        </ul>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <a href="{{ route('family.edit', $family->id) }}"
                            class="px-4 py-2 bg-yellow-500 text-white text-xs font-medium rounded-md shadow hover:bg-yellow-600 focus:outline-none">
                            Editar
                        </a>

                        <a href="{{ route('family.delete', $family->id) }}"
                            class="px-4 py-2 bg-red-600 text-white text-xs font-medium rounded-md shadow hover:bg-red-700 focus:outline-none ml-2">
                            Excluir
                        </a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
@endsection
