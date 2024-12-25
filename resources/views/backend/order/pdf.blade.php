<!DOCTYPE html>
<html>
<head>
  <title>Order @if($order) - {{$order->order_number}} @endif</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

@if($order)
<style type="text/css">
  .invoice-header {
    background: #f7f7f7;
    padding: 10px 20px;
    border-bottom: 1px solid gray;
  }
  .site-logo {
    margin-top: 20px;
  }
  .invoice-right-top h3 {
    padding-right: 20px;
    margin-top: 20px;
    color: green;
    font-size: 30px!important;
    font-family: serif;
  }
  .invoice-left-top {
    border-left: 4px solid green;
    padding-left: 20px;
    padding-top: 20px;
  }
  .invoice-left-top p {
    margin: 0;
    line-height: 20px;
    font-size: 16px;
    margin-bottom: 3px;
  }
  thead {
    background: green;
    color: #FFF;
  }
  .authority h5 {
    margin-top: -10px;
    color: green;
  }
  .thanks h4 {
    color: green;
    font-size: 25px;
    font-weight: normal;
    font-family: serif;
    margin-top: 20px;
  }
  .site-address p {
    line-height: 6px;
    font-weight: 300;
  }
  .table tfoot .empty {
    border: none;
  }
  .table-bordered {
    border: none;
  }
  .table-header {
    padding: .75rem 1.25rem;
    margin-bottom: 0;
    background-color: rgba(0,0,0,.03);
    border-bottom: 1px solid rgba(0,0,0,.125);
  }
  .table td, .table th {
    padding: .30rem;
  }
</style>

  <div class="invoice-header">
    <div class="float-left site-logo">
      <img src="{{asset('backend/img/logo.png')}}" alt="">
    </div>
    <div class="float-right site-address">
      <h4>{{env('APP_NAME')}}</h4>
      <p>{{env('APP_ADDRESS')}}</p>
      <p>Phone: <a href="tel:{{env('APP_PHONE')}}">{{env('APP_PHONE')}}</a></p>
      <p>Email: <a href="mailto:{{env('APP_EMAIL')}}">{{env('APP_EMAIL')}}</a></p>
    </div>
    <div class="clearfix"></div>
  </div>

  <div class="invoice-description">
    <div class="invoice-left-top float-left">
      <h6>Invoice to</h6>
      <h3>{{$order->fullname}}</h3>
      <div class="address">
        <p><strong>Address: </strong>{{ $order->address }}</p>
        <p><strong>Phone:</strong> {{ $order->phone }}</p>
        <p><strong>Email:</strong> {{ $order->email }}</p>
      </div>
    </div>

    <div class="invoice-right-top float-right">
      <h3>Invoice #{{$order->order_number}}</h3>
      <p>{{ $order->created_at->format('D d m Y') }}</p>
    </div>
    <div class="clearfix"></div>
  </div>

  <section class="order_details pt-3">
    <div class="table-header">
      <h5>Order Details</h5>
    </div>
    <table class="table table-bordered table-striped">
      <thead>
        <tr>
          <th scope="col" class="col-6">Product</th>
          <th scope="col" class="col-3">Quantity</th>
          <th scope="col" class="col-3">Total</th>
        </tr>
      </thead>
      <tbody>
        @foreach($order->cart_info as $cart)
          <tr>
            <td>{{$cart->product->title ?? 'Product not found'}}</td> <!-- Eager loaded product -->
            <td>x{{$cart->quantity}}</td>
            <td><span>${{number_format($cart->price,2)}}</span></td>
          </tr>
        @endforeach
      </tbody>
      <tfoot>
        <tr>
          <th scope="col" class="empty"></th>
          <th scope="col" class="text-right">Subtotal:</th>
          <th><span>${{number_format($order->sub_total,2)}}</span></th>
        </tr>
        <tr>
          <th scope="col" class="empty"></th>
          <th scope="col" class="text-right">Total:</th>
          <th><span>${{number_format($order->total_amount,2)}}</span></th>
        </tr>
      </tfoot>
    </table>
  </section>

  <div class="thanks mt-3">
    <h4>Thank you for your business !!</h4>
  </div>

  <div class="authority float-right mt-5">
    <p>-----------------------------------</p>
    <h5>Authority Signature:</h5>
  </div>

  <div class="clearfix"></div>
@else
  <h5 class="text-danger">Invalid order details!</h5>
@endif

</body>
</html>
