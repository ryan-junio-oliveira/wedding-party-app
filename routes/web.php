<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FamilyController;

Route::get('/', [FamilyController::class, 'index'])->name('families.index');
Route::get('/family/create', [FamilyController::class, 'create'])->name('family.create');
Route::post('/family/store', [FamilyController::class, 'store'])->name('family.store');
Route::get('/families/{id}/delete', [FamilyController::class, 'delete'])->name('family.delete');
Route::delete('/families/{id}', [FamilyController::class, 'destroy'])->name('family.destroy');
Route::get('/families/{id}/edit', [FamilyController::class, 'edit'])->name('family.edit');
Route::put('/families/{id}', [FamilyController::class, 'update'])->name('family.update');

