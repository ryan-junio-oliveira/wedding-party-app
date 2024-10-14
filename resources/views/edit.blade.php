@extends('layout')

@section('title', 'Edit Family')

@section('header', 'Edit Family')

@section('content')
<div class="mb-6">
    <a href="{{ route('family.index') }}" 
       class="inline-block px-4 py-2 bg-gray-600 text-white text-sm font-medium rounded-md shadow hover:bg-gray-700 focus:outline-none mb-4">
       Retornar para a dashboard
    </a>
</div>

<div class="bg-white shadow overflow-hidden sm:rounded-lg p-6">
    <form action="{{ route('family.update', $family->id) }}" method="POST" class="space-y-6">
        @csrf
        @method('PUT')

        <div>
            <label for="name" class="block text-sm font-medium text-gray-700">Nome da Familia</label>
            <input type="text" name="name" id="name" value="{{ $family->name }}" required
                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
        </div>

        <div>
            <label for="members" class="block text-sm font-medium text-gray-700">Membros da Familia</label>
            <div id="members-container" class="space-y-2">
                @foreach ($family->members as $member)
                    <input type="text" name="members[]" value="{{ $member->name }}" required
                        class="block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                @endforeach
            </div>
            <button type="button" onclick="addMember()"
                class="mt-2 px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-md shadow hover:bg-blue-700 focus:outline-none">
                Adicionar Membro
            </button>
        </div>

        <div>
            <button type="submit" 
                class="w-full px-4 py-2 bg-green-600 text-white text-sm font-medium rounded-md shadow hover:bg-green-700 focus:outline-none">
                Atualizar Familia
            </button>
        </div>
    </form>
</div>

<script>
    function addMember() {
        const container = document.getElementById('members-container');
        const input = document.createElement('input');
        input.setAttribute('type', 'text');
        input.setAttribute('name', 'members[]');
        input.setAttribute('required', true);
        input.setAttribute('class', 'block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm');
        container.appendChild(input);
    }
</script>
@endsection
