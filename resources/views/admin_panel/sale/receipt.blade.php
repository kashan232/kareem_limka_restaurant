<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cash Memo - Zam Zam Electronic</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 12px;
            margin: 0;
            padding: 0;
        }

        .receipt-container {
            width: 280px;
            margin: auto;
            padding: 10px;
            border: 1px dashed #000;
        }

        .receipt-header {
            text-align: center;
            font-size: 14px;
            font-weight: bold;
        }

        .details {
            margin-top: 10px;
        }

        .details p {
            margin: 3px 0;
        }

        table {
            width: 100%;
            font-size: 12px;
            border-collapse: collapse;
            margin-top: 5px;
        }

        th, td {
            padding: 3px;
            text-align: left;
            border-bottom: 1px dashed #000;
        }

        .totals td {
            font-weight: bold;
            text-align: right;
        }

        .receipt-footer {
            text-align: center;
            margin-top: 10px;
            font-size: 12px;
        }

        .note {
            font-size: 12px;
            font-weight: bold;
            margin-top: 5px;
        }

        @media print {
            body {
                margin: 0;
                padding: 0;
            }

            .receipt-container {
                border: none;
            }
        }
    </style>
</head>

<body>
    <div class="receipt-container">
        <!-- Receipt Header -->
        <div class="receipt-header">
            <p>SHELBYS RESTAURANT <br> & <br> FAST FOOD</p>
        </div>

        <!-- Sale Details -->
        <div class="details">
            <p><strong>Invoice No:</strong> {{ $sale->invoice_no }}</p>
            <p><strong>Customer:</strong> {{ $sale->customer }}</p>
            <p><strong>Date:</strong> {{ \Carbon\Carbon::parse($sale->created_at)->format('d/m/Y h:i A') }}</p>
        </div>

        <!-- Items Table -->
        <table>
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Qty</th>
                    <th>Rate</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                @foreach(json_decode($sale->item_name) as $key => $item)
                <tr>
                    <td>{{ $item }}</td>
                    <td>{{ json_decode($sale->quantity)[$key] }}</td>
                    <td>{{ number_format(json_decode($sale->price)[$key], 0) }}</td>
                    <td>{{ number_format(json_decode($sale->total)[$key], 0) }}</td>
                </tr>
                @endforeach
            </tbody>
            <tfoot>
                <tr class="totals">
                    <td colspan="3">Total</td>
                    <td>{{ $sale->total_price }}</td>
                </tr>
                <tr class="totals">
                    <td colspan="3">Discount</td>
                    <td>{{ $sale->discount }}</td>
                </tr>
                <tr class="totals">
                    <td colspan="3">Net Total</td>
                    <td>{{ $sale->Payable_amount }}</td>
                </tr>
            </tfoot>
        </table>

        <!-- Footer Message -->
        <div class="receipt-footer">
            <p class="note">No Exchange or Refund</p>
            <p>Designed & Developed by ProWave Software Solution</p>
            <p><strong>0317-3836223 | 0317-3859647</strong></p>
        </div>
    </div>

    <script>
        window.onload = function () {
            window.print();
            setTimeout(function () {
                window.location.href = "{{ route('all-sales') }}";
            }, 1000);
        };
    </script>
</body>

</html>
