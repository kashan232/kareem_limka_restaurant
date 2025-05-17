@include('admin_panel.include.header_include')
<body>
    <!-- page-wrapper start -->
    <div class="page-wrapper default-version">
        @include('admin_panel.include.sidebar_include')

        <!-- navbar-wrapper start -->
        @include('admin_panel.include.navbar_include')
        <!-- navbar-wrapper end -->

        <div class="body-wrapper">
            <div class="bodywrapper__inner">
                <div class="d-flex mb-30 flex-wrap gap-3 justify-content-between align-items-center">
                    <h6 class="page-title">All Tables </h6>
                    <div class="d-flex flex-wrap justify-content-end gap-2 align-items-center breadcrumb-plugins">
                    
                        <button type="button" class="btn btn-sm btn-outline--primary cuModalBtn" data-bs-toggle="modal"
                            data-bs-target="#cuModal">
                            <i class="las la-plus"></i> Add New
                        </button>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card b-radius--10">
                            <div class="card-body p-0">
                                @if (session()->has('success'))
                                    <div class="alert alert-success">
                                        <strong>Success!</strong> {{ session('success') }}.
                                    </div>
                                @endif

                                <div class="table-responsive--sm table-responsive">
                                    <table id="example" class="display table table--light style--two bg--white" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>Table No</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @forelse ($tables as $table)
                                                <tr>
                                                    <td>{{ $loop->iteration }}</td>
                                                    <td>{{ $table->table_no }}</td>
                                                    <td>{{ $table->table_name ?? 'with out name' }}</td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-primary edittableBtn"
                                                        data-id="{{ $table->id }}"
                                                        data-no="{{ $table->table_no }}"
                                                        data-name="{{ $table->table_name }}"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#editTableModal">
                                                        Edit
                                                    </button>
                                                    

                                                    </td>
                                                </tr>
                                            @empty
                                                <tr>
                                                    <td colspan="3" class="text-center">No data found</td>
                                                </tr>
                                            @endforelse
                                        </tbody>
                                    </table>
                                </div><!-- table end -->
                            </div>
                        </div>
                    </div>
                </div>

                  <!-- Add Table Modal -->
                  <div class="modal fade" id="cuModal" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <form action="{{ route('store-table') }}" method="POST">
                            @csrf
                            <div class="modal-content">
                                <div class="modal-header">
                                    {{-- <h4 class="modal-title">Add New Table</h4> --}}
                                    <h5> Add New Table</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label>Table Name</label>
                                        <input type="text" name="table_name" class="form-control"
                                             required>
                                    </div>
                                    <div class="form-group">
                                        <label>Table No</label>
                                        <input type="text" name="table_no" class="form-control"
                                            value="{{ $nextTableNo }}" readonly required>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn--primary">Add Table</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>


            <!-- Edit Table Modal -->
<div class="modal fade" id="editTableModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <form action="{{ route('update-table') }}" method="POST">
            @csrf
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Table</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="editTableId">
                    <div class="form-group">
                        <label>Table Name</label>
                        <input type="text" name="table_name" id="editTableName" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Table No</label>
                        <input type="text" name="table_no" readonly id="editTableNo" class="form-control" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn--primary">Update</button>
                </div>
            </div>
        </form>
    </div>
</div>


            </div><!-- bodywrapper__inner end -->
        </div><!-- body-wrapper end -->
    </div><!-- page-wrapper end -->

    @include('admin_panel.include.footer_include')

    <script>
        $(document).ready(function() {
            $('.edittableBtn').click(function() {
                $('#editTableId').val($(this).data('id'));
                $('#editTableNo').val($(this).data('no'));
                $('#editTableName').val($(this).data('name'));
            });
        });
    </script>
    
</body>
