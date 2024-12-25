<table class="table table-bordered table-hover">
                <thead class="thead-light">
                    <tr>
                        <th>#</th>
                        <th>Tên Sản Phẩm</th>
                        <th>Số Lượng Bán</th>
                        <th>Tổng Doanh Thu</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $__currentLoopData = $data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <tr>
                        <td><?php echo e($index + 1); ?></td>
                        <td><?php echo e($item['title']); ?></td>
                        <td><?php echo e($item['quantity']); ?></td>
                        <td><?php echo e(number_format($item['total_amount'], 0, ',', '.')); ?> VND</td>
                    </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </tbody>
            </table>
<?php /**PATH C:\Users\hau06\Downloads\Ecommerce_TBMT2\Ecommerce_TBMT2\Ecommerce_TBMT\resources\views/backend/exports/order_report.blade.php ENDPATH**/ ?>