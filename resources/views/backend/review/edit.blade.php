@extends('backend.layouts.master')

@section('title','Chỉnh Sửa Đánh Giá')

@section('main-content')
<div class="card">
  <h5 class="card-header">Chỉnh Sửa Đánh Giá</h5>
  <div class="card-body">
    <form action="{{route('review.update',$review->id)}}" method="POST">
      @csrf
      @method('PATCH')
      <div class="form-group">
        <label for="name">Người Đánh Giá:</label>
        <input type="text" disabled class="form-control" value="{{$review->user_info->name}}">
      </div>
      <div class="form-group">
        <label for="review">Đánh Giá</label>
        <textarea name="review" id="" cols="20" rows="10" class="form-control">{{$review->review}}</textarea>
      </div>
      <div class="form-group">
        <label for="status">Trạng Thái :</label>
        <select name="status" id="" class="form-control">
          <option value="">--Chọn Trạng Thái--</option>
          <option value="active" {{(($review->status=='active')? 'selected' : '')}}>Kích Hoạt</option>
          <option value="inactive" {{(($review->status=='inactive')? 'selected' : '')}}>Không Kích Hoạt</option>
        </select>
      </div>
      <button type="submit" class="btn btn-primary">Cập Nhật</button>
    </form>
  </div>
</div>
@endsection

@push('styles')
<style>
    .order-info, .shipping-info {
        background:#ECECEC;
        padding:20px;
    }
    .order-info h4, .shipping-info h4 {
        text-decoration: underline;
    }
</style>
@endpush
