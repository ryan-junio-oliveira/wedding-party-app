<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relatório de Famílias</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        /* Estilos adicionais para garantir que funcionem no PDF */
        body {
            font-family: Arial, sans-serif;
        }

        table {
            border-collapse: collapse;
            margin-top: 20px;
            width: 100%;
        }

        th,
        td {
            border: 1px solid #000;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #4A5568; /* Cor de fundo mais escura */
            color: white; /* Texto em branco para contraste */
        }

        .table-container {
            margin-top: 20px;
            border: 1px solid #E2E8F0; /* Bordas suaves */
            border-radius: 8px;
            overflow: hidden; /* Bordas arredondadas */
        }

        .total {
            font-size: 1.25rem;
            font-weight: bold;
            margin-top: 20px;
            color: #2D3748; /* Cor para o total */
        }

        hr {
            border: 1px solid #E2E8F0; /* Cor mais suave para a linha */
            margin: 20px 0; /* Margens na linha */
        }
    </style>
</head>

<body class="bg-white">
    <div class="max-w-3xl mx-auto px-4">
        <h1 class="text-3xl font-bold text-center mb-6">Relatório de Famílias</h1>

        <div class="table-container">
            <table class="min-w-full">
                <thead>
                    <tr class="bg-gray-800">
                        <th class="py-3 px-4 border">Nome da Família</th>
                        <th class="py-3 px-4 border">Total de Membros</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($family as $f)
                    <tr class="hover:bg-gray-100 transition duration-200">
                        <td class="py-3 px-4 border">{{ $f->name }}</td>
                        <td class="py-3 px-4 border">{{ $f->members->count() }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        <h2 class="total">Total de Familias: {{ $totalfamily }}</h2>

        <hr>

        <h2 class="text-2xl font-semibold mb-4">Detalhes dos Membros:</h2>
        <div class="table-container">
            <table class="min-w-full">
                <thead>
                    <tr class="bg-gray-800">
                        <th class="py-3 px-4 border">Nome da Família</th>
                        <th class="py-3 px-4 border">Membros</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($family as $f)
                    <tr class="hover:bg-gray-100 transition duration-200">
                        <td class="py-3 px-4 border">{{ $f->name }}</td>
                        <td class="py-3 px-4 border">
                            <ul class="list-disc pl-5">
                                @foreach ($f->members as $member)
                                <li>{{ $member->name }}</li>
                                @endforeach
                            </ul>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        
        <h2 class="total">Total de Convidados: {{ $totalGuests }}</h2>
    </div>
</body>

</html>
