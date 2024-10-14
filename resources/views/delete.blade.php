@extends('layout')

@section('title', 'Delete Family')

@section('header', 'Confirm Family Deletion')

@section('content')
    <div class="mb-6">
        <a href="{{ route('families.index') }}" 
           class="inline-block px-4 py-2 bg-gray-600 text-white text-sm font-medium rounded-md shadow hover:bg-gray-700 focus:outline-none mb-4">
           Back to Dashboard
        </a>
    </div>

    <div class="bg-white shadow overflow-hidden sm:rounded-lg p-6">
        <p class="text-xl font-semibold text-gray-700">Are you sure you want to delete the family <span class="text-red-600">{{ $family->name }}</span> and all its members?</p>

        <div class="mt-6 flex space-x-4">
            <form action="{{ route('family.destroy', $family->id) }}" method="POST">
                @csrf
                @method('DELETE')
                <button type="submit" 
                    class="px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-md shadow hover:bg-red-700 focus:outline-none">
                    Yes, Delete Family
                </button>
            </form>
            <a href="{{ route('families.index') }}" 
               class="px-4 py-2 bg-gray-600 text-white text-sm font-medium rounded-md shadow hover:bg-gray-700 focus:outline-none">
               Cancel
            </a>
        </div>
    </div>
@endsection
