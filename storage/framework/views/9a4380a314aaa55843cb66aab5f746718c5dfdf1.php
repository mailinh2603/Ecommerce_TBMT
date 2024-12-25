<?php $__env->startSection('main-content'); ?>
<!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="row">
        <div class="col-md-12">
            <?php echo $__env->make('backend.layouts.notification', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        </div>
    </div>
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary float-left">Danh sách Đơn Hàng</h6>
    </div>
    <div class="card-body">
        <!-- Form Lọc -->
        <form action="<?php echo e(route('order.reportgetSalesList')); ?>" method="get" class="form-inline mb-3">
            <label for="month" class="mr-2">Chọn Tháng:</label>
            <select name="month" id="month" class="form-control mr-3">
                <?php for($i = 1; $i <= 12; $i++): ?>
                    <option value="<?php echo e($i); ?>" <?php echo e($i == $month ? 'selected' : ''); ?>>
                        <?php echo e(date('F', mktime(0, 0, 0, $i, 1))); ?>

                    </option>
                <?php endfor; ?>
            </select>

            <label for="year" class="mr-2">Chọn Năm:</label>
            <select name="year" id="year" class="form-control mr-3">
                <?php $__currentLoopData = range(2020, \Carbon\Carbon::now()->year); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $yearOption): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <option value="<?php echo e($yearOption); ?>" <?php echo e($yearOption == $year ? 'selected' : ''); ?>>
                        <?php echo e($yearOption); ?>

                    </option>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </select>

            <button type="submit" class="btn btn-primary">
                <i class="fas fa-search"></i> Xem Báo Cáo
            </button>

            <!-- Nút Xuất Excel -->
            <a href="<?php echo e(route('order.export', ['month' => request('month'), 'year' => request('year')])); ?>"
               class="btn btn-success ml-2">
                <i class="fas fa-file-excel"></i> Xuất Excel
            </a>
        </form>

        <!-- Bảng hiển thị -->
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead class="thead-light">
                    <tr>
                        <th>#</th>
                        <th>Tên Sản Phẩm</th>
                        <th>Số Lượng Bán</th>
                        <th>Tổng Doanh Thu</th>
                        <th>Xuất Chi Tiết</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        $totalRevenue = 0; // Biến tính tổng doanh thu
                    ?>
                    <?php $__currentLoopData = $data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <tr>
                        <td><?php echo e($index + 1); ?></td>
                        <td><?php echo e($item['title']); ?></td>
                        <td><?php echo e($item['quantity']); ?></td>
                        <td><?php echo e(number_format($item['total_amount'], 0, ',', '.')); ?> VND</td>
                        <td>
                            <a href="<?php echo e(route('export.product.details', ['title' => $item['title'], 'month' => $month, 'year' => $year])); ?>"
                               class="btn btn-info btn-sm">
                                <i class="fas fa-file-excel"></i> Xuất Chi Tiết
                            </a>
                        </td>
                    </tr>
                    <?php
                        $totalRevenue += $item['total_amount'];
                    ?>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="3" class="text-right">Tổng Doanh Thu:</th>
                        <th><?php echo e(number_format($totalRevenue, 0, ',', '.')); ?> VND</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('backend.layouts.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\hau06\Downloads\Ecommerce_TBMT2\Ecommerce_TBMT2\Ecommerce_TBMT\resources\views/backend/report/index.blade.php ENDPATH**/ ?>