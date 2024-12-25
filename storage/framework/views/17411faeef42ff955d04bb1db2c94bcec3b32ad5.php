<?php $__env->startSection('title','Order Detail'); ?>

<?php $__env->startSection('main-content'); ?>
<div class="card">
<h5 class="card-header">Đơn hàng       <a href="<?php echo e(route('order.pdf',$order->id)); ?>" class=" btn btn-sm btn-primary shadow-sm float-right"><i class="fas fa-download fa-sm text-white-50"></i> Xuất file PDF</a>
  </h5>
  <div class="card-body">
    <?php if($order): ?>
    <table class="table table-striped table-hover table-hover">
      <thead>
        <tr>
            <th>#</th>
            <th>Mã đơn</th>
            <th>Họ Tên Khách hàng</th>
            <th>Email</th>
            <th>Số lượng</th>
            <th>Tổng tiền</th>
            <th>Trạng thái</th>
            <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <tr>
            <td><?php echo e($order->id); ?></td>
            <td><?php echo e($order->order_number); ?></td>
            <td><?php echo e($order->fullname); ?></td>
            <td><?php echo e($order->email); ?></td>
            <td><?php echo e($order->quantity); ?></td>
            <td><?php echo e(number_format($order->total_amount,0, ',', '.')); ?> ₫</td>
            <td>
                <?php if($order->status=='new'): ?>
                  <span class="badge badge-primary">NEW</span>
                <?php elseif($order->status=='process'): ?>
                  <span class="badge badge-warning">PROCESSING</span>
                <?php elseif($order->status=='delivered'): ?>
                  <span class="badge badge-success">DELIVERED</span>
                <?php else: ?>
                  <span class="badge badge-danger"><?php echo e($order->status); ?></span>
                <?php endif; ?>
            </td>
            <td>
                <form method="POST" action="<?php echo e(route('order.destroy',[$order->id])); ?>">
                  <?php echo csrf_field(); ?>
                  <?php echo method_field('delete'); ?>
                      <button class="btn btn-danger btn-sm dltBtn" data-id=<?php echo e($order->id); ?> style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" data-placement="bottom" title="Delete"><i class="fas fa-trash-alt"></i></button>
                </form>
            </td>

        </tr>
      </tbody>
    </table>

    <section class="confirmation_part section_padding">
      <div class="order_boxes">
        <div class="row">
          <div class="col-lg-6 col-lx-4">
            <div class="order-info">
              <h4 class="text-center pb-4">Thông tin đơn hàng</h4>
              <table class="table">
                    <tr class="">
                        <td>Mã đơn hàng</td>
                        <td> : <?php echo e($order->order_number); ?></td>
                    </tr>
                    <tr>
                        <td>Ngày đặt</td>
                        <td> : <?php echo e($order->created_at->format('D d M, Y')); ?> at <?php echo e($order->created_at->format('g : i a')); ?> </td>
                    </tr>
                    <tr>
                        <td>Số lượng</td>
                        <td> : <?php echo e($order->quantity); ?></td>
                    </tr>
                    <tr>
                        <td>Tình trạng</td>
                        <td> : <?php echo e($order->status); ?></td>
                    </tr>

                    <tr>
                        <td>Tổng tiền</td>
                        <td>: <?php echo e(number_format($order->total_amount, 0, ',', '.')); ?> ₫</td>
                    </tr>
                    <tr>
                      <td>Phương thức thanh toán</td>
                      <td> :
                            <?php if($order->payment_method == 'cod'): ?>
                                Thanh toán khi nhận hàng
                            <?php elseif($order->payment_method == 'paypal'): ?>
                                Paypal
                            <?php elseif($order->payment_method == 'cardpay'): ?>
                                Card Payment
                            <?php endif; ?>
                        </td>
                    </tr>
                    <tr>
                        <td>Trạng thái thanh toán</td>
                        <td> :
                          <?php if($order->payment_status == 'paid'): ?>
                              <span class="badge badge-success">Đã thanh toán</span>
                          <?php elseif($order->payment_status == 'unpaid'): ?>
                              <span class="badge badge-danger">Chưa thanh toán</span>
                          <?php else: ?>
                              <?php echo e($order->payment_status); ?>

                          <?php endif; ?>
                      </td>
                    </tr>
              </table>
            </div>
          </div>

          <div class="col-lg-6 col-lx-4">
            <div class="shipping-info">
              <h4 class="text-center pb-4">Thông tin vận chuyển</h4>
              <table class="table">
                    <tr class="">
                        <td>Họ tên khách hàng</td>
                        <td> : <?php echo e($order->fullname); ?></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td> : <?php echo e($order->email); ?></td>
                    </tr>
                    <tr>
                        <td>Số điện thoại</td>
                        <td> : <?php echo e($order->phone); ?></td>
                    </tr>
                    <tr>
                        <td>Địa chỉ</td>
                        <td> : <?php echo e($order->address); ?></td>
                    </tr>

              </table>
            </div>
          </div>
        </div>
      </div>
    </section>
    <?php endif; ?>

  </div>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('styles'); ?>
<style>
    .order-info,.shipping-info{
        background:#ECECEC;
        padding:20px;
    }
    .order-info h4,.shipping-info h4{
        text-decoration: underline;
    }

</style>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('user.layouts.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\hau06\Downloads\Ecommerce_TBMT2\Ecommerce_TBMT2\Ecommerce_TBMT\resources\views/user/order/show.blade.php ENDPATH**/ ?>