<?php $__env->startSection('main-content'); ?>
 <!-- DataTales Example -->
 <div class="card shadow mb-4">
     <div class="row">
         <div class="col-md-12">
            <?php echo $__env->make('backend.layouts.notification', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
         </div>
     </div>
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary float-left">Danh Sách Sản Phẩm</h6>
      <a href="<?php echo e(route('product.create')); ?>" class="btn btn-primary btn-sm float-right" data-toggle="tooltip" data-placement="bottom" title="Thêm Sản Phẩm"><i class="fas fa-plus"></i> Thêm Sản Phẩm</a>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <?php if(count($products)>0): ?>
        <table class="table table-bordered table-hover" id="product-dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>#</th>
              <th>Tiêu Đề</th>
              <th>Danh Mục</th>
              <th>Nổi Bật</th>
              <th>Giá</th>
              <th>Giảm Giá</th>
              <th>Kích Thước</th>
              <th>Tình Trạng</th>
              <th>Thương Hiệu</th>
              <th>Kho</th>
              <th>Ảnh</th>
              <th>Trạng Thái</th>
              <th>Hành Động</th>
            </tr>
          </thead>
          <tbody>

            <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
              <?php
              $sub_cat_info=DB::table('categories')->select('title')->where('id',$product->child_cat_id)->get();
              $brands=DB::table('brands')->select('title')->where('id',$product->brand_id)->get();
              ?>
                <tr>
                    <td><?php echo e($product->id); ?></td>
                    <td><?php echo e($product->title); ?></td>
                    <td><?php echo e($product->cat_info['title']); ?>

                      <sub>
                          <?php echo e($product->sub_cat_info->title ?? ''); ?>

                      </sub>
                    </td>
                    <td><?php echo e((($product->is_featured==1)? 'Có': 'Không')); ?></td>
                    <td><?php echo e($product->price); ?> VND</td>
                    <td>  <?php echo e($product->discount); ?>%</td>
                    <td><?php echo e($product->size); ?></td>
                    <td><?php echo e($product->condition); ?></td>
                    <td> <?php echo e(ucfirst($product->brand->title)); ?></td>
                    <td>
                      <?php if($product->stock>0): ?>
                      <span class="badge badge-primary"><?php echo e($product->stock); ?></span>
                      <?php else: ?>
                      <span class="badge badge-danger"><?php echo e($product->stock); ?></span>
                      <?php endif; ?>
                    </td>
                    <td>
                        <?php if($product->photo): ?>
                            <?php
                              $photo=explode(',',$product->photo);
                            ?>
                            <img src="<?php echo e($photo[0]); ?>" class="img-fluid zoom" style="max-width:80px" alt="<?php echo e($product->photo); ?>">
                        <?php else: ?>
                            <img src="<?php echo e(asset('backend/img/thumbnail-default.jpg')); ?>" class="img-fluid" style="max-width:80px" alt="avatar.png">
                        <?php endif; ?>
                    </td>
                    <td>
                        <?php if($product->status=='active'): ?>
                            <span class="badge badge-success"><?php echo e($product->status); ?></span>
                        <?php else: ?>
                            <span class="badge badge-warning"><?php echo e($product->status); ?></span>
                        <?php endif; ?>
                    </td>
                    <td>
                        <a href="<?php echo e(route('product.edit',$product->id)); ?>" class="btn btn-primary btn-sm float-left mr-1" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" title="Chỉnh sửa" data-placement="bottom"><i class="fas fa-edit"></i></a>
                    <form method="POST" action="<?php echo e(route('product.destroy',[$product->id])); ?>">
                      <?php echo csrf_field(); ?>
                      <?php echo method_field('delete'); ?>
                          <button class="btn btn-danger btn-sm dltBtn" data-id=<?php echo e($product->id); ?> style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" data-placement="bottom" title="Xóa"><i class="fas fa-trash-alt"></i></button>
                        </form>
                    </td>
                </tr>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
          </tbody>
        </table>
        <span style="float:right"><?php echo e($products->links()); ?></span>
        <?php else: ?>
          <h6 class="text-center">Không tìm thấy sản phẩm! Vui lòng tạo sản phẩm.</h6>
        <?php endif; ?>
      </div>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('styles'); ?>
  <link href="<?php echo e(asset('backend/vendor/datatables/dataTables.bootstrap4.min.css')); ?>" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
  <style>
      div.dataTables_wrapper div.dataTables_paginate{
          display: none;
      }
      .zoom {
        transition: transform .2s;
      }

      .zoom:hover {
        transform: scale(5);
      }
  </style>
<?php $__env->stopPush(); ?>

<?php $__env->startPush('scripts'); ?>

  <script src="<?php echo e(asset('backend/vendor/datatables/jquery.dataTables.min.js')); ?>"></script>
  <script src="<?php echo e(asset('backend/vendor/datatables/dataTables.bootstrap4.min.js')); ?>"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

  <script src="<?php echo e(asset('backend/js/demo/datatables-demo.js')); ?>"></script>
  <script>

      $('#product-dataTable').DataTable( {
        "scrollX": false,
            "columnDefs":[
                {
                    "orderable":false,
                    "targets":[10,11,12]
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
                    title: "Bạn có chắc chắn không?",
                    text: "Sau khi xóa, bạn sẽ không thể khôi phục dữ liệu này!",
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
<?php $__env->stopPush(); ?>

<?php echo $__env->make('backend.layouts.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\hau06\Downloads\Ecommerce_TBMT2\Ecommerce_TBMT2\Ecommerce_TBMT\resources\views/backend/product/index.blade.php ENDPATH**/ ?>