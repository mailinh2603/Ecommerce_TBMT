@extends('backend.layouts.master')

@section('main-content')
 <!-- DataTales Example -->
 <div class="card shadow mb-4">
     <div class="row">
         <div class="col-md-12">
            @include('backend.layouts.notification')
         </div>
     </div>
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary float-left">Danh Sách Đánh Giá</h6>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        @if(count($reviews)>0)
        <table class="table table-bordered table-hover" id="order-dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>#</th>
              <th>Người Đánh Giá</th>
              <th>Sản Phẩm</th>
              <th>Đánh Giá</th>
              <th>Xếp Hạng</th>
              <th>Ngày</th>
              <th>Trạng Thái</th>
              <th>Hành Động</th>
            </tr>
          </thead>
          
          <tbody>
            @foreach($reviews as $review)
                <tr>
                    <td>{{$review->id}}</td>
                    <td>{{$review->user_info['name']}}</td>
                    <td>{{ $review->product ? $review->product->title : 'Không tìm thấy sản phẩm' }}</td>
                    <td>{{$review->review}}</td>
                    <td>
                     <ul style="list-style:none">
                          @for($i=1; $i<=5;$i++)
                          @if($review->rate >=$i)
                            <li style="float:left;color:#F7941D;"><i class="fa fa-star"></i></li>
                          @else
                            <li style="float:left;color:#F7941D;"><i class="far fa-star"></i></li>
                          @endif
                        @endfor
                     </ul>
                    </td>
                    <td>{{$review->created_at->format('d M, Y g:i a')}}</td>
                    <td>
                        @if($review->status=='active')
                          <span class="badge badge-success">Kích Hoạt</span>
                        @else
                          <span class="badge badge-warning">Không Kích Hoạt</span>
                        @endif
                    </td>
                    <td>
                        <a href="{{route('review.edit',$review->id)}}" class="btn btn-primary btn-sm float-left mr-1" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" title="Chỉnh sửa" data-placement="bottom"><i class="fas fa-edit"></i></a>
                        <form method="POST" action="{{route('review.destroy',[$review->id])}}">
                          @csrf
                          @method('delete')
                              <button class="btn btn-danger btn-sm dltBtn" data-id={{$review->id}} style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" data-placement="bottom" title="Xóa"><i class="fas fa-trash-alt"></i></button>
                        </form>
                    </td>
                </tr>
            @endforeach
          </tbody>
        </table>
        <span style="float:right">{{$reviews->links()}}</span>
        @else
          <h6 class="text-center">Không có đánh giá nào!!!</h6>
        @endif
      </div>
    </div>
</div>
@endsection

@push('styles')
  <link href="{{asset('backend/vendor/datatables/dataTables.bootstrap4.min.css')}}" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
  <style>
      div.dataTables_wrapper div.dataTables_paginate{
          display: none;
      }
  </style>
@endpush

@push('scripts')

  <!-- Page level plugins -->
  <script src="{{asset('backend/vendor/datatables/jquery.dataTables.min.js')}}"></script>
  <script src="{{asset('backend/vendor/datatables/dataTables.bootstrap4.min.js')}}"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="{{asset('backend/js/demo/datatables-demo.js')}}"></script>
  <script>

      $('#order-dataTable').DataTable( {
            "columnDefs":[
                {
                    "orderable":false,
                    "targets":[5,6]
                }
            ]
        } );

        // Sweet alert

        function deleteData(id){

        }
  </script>
  <script>
      $(document).ready(function(){
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
          $('.dltBtn').click(function(e){
            var form=$(this).closest('form');
              var dataID=$(this).data('id');
              e.preventDefault();
              swal({
                    title: "Bạn có chắc chắn?",
                    text: "Một khi đã xóa, bạn sẽ không thể khôi phục lại dữ liệu này!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((willDelete) => {
                    if (willDelete) {
                       form.submit();
                    } else {
                        swal("Dữ liệu của bạn an toàn!");
                    }
                });
          })
      })
  </script>
@endpush