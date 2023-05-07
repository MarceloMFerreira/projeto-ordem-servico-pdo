<?php
require_once('../valida_session/valida_session.php');
require_once('../layout/header.php'); 
require_once('../layout/sidebar.php'); 
require_once ('../bd/bd_ordem.php');
require_once ("../bd/bd_generico.php");
?>

<!-- Main Content -->
<div id="content">
 <?php require_once('../layout/navbar.php');?>

 <!-- Begin Page Content -->
 <div class="container-fluid">

    <!-- Content Row -->
    <div class="row">

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4" id="cards-notice">
            <div class="card border-left-danger shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
                            Ordens de Serviço Abertas</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <?php
                                if ($_SESSION['perfil'] == 1) {
                                    $status = 1;
                                    $total = consultaStatusUsuario($status);
                                    echo '<a href="../ordem/ordem.php?status=1"' . $total['0']['total'] . '" style="color: #e74a3b;">' .$total['0']['total'] . '</a>';
                                }
                                if ($_SESSION['perfil'] == 2) {
                                    $cod_usuario = $_SESSION['cod_usu'];
                                    $status = 1;
                                    $clienteTerceirizado= 1;
                                    $total = consultaStatusClienteTercerizado($clienteTerceirizado,$cod_usuario,$status);
                                    echo '<a href="../ordem/ordem.php?status=1"' . $total['0']['total'] . '" style="color: #e74a3b;">' .$total['0']['total'] . '</a>';
                                }
                                if ($_SESSION['perfil'] == 3) {
                                    $cod_usuario = $_SESSION['cod_usu'];
                                    $status = 1;
                                    $clienteTerceirizado = 0;
                                    $total = consultaStatusClienteTercerizado($clienteTerceirizado,$cod_usuario,$status);
                                    echo '<a href="../ordem/ordem.php?status=1"' . $total['0']['total'] . '" style="color: #e74a3b;">' .$total['0']['total'] . '</a>';
                                }
                            ?>

                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6 mb-4" id="cards-notice">
            <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                            Ordens de Serviço em Execução</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                              <?php
                                if ($_SESSION['perfil'] == 1) {
                                    $status = 2;
                                    $total = consultaStatusUsuario($status);
                                    echo '<a href="../ordem/ordem.php?status=2"' . $total['0']['total'] . '" style="color: #f6c23e;">' . $total['0']['total'] . '</a>';
                                }
                                if ($_SESSION['perfil'] == 2) {
                                    $cod_usuario = $_SESSION['cod_usu'];
                                    $status = 2;
                                    $clienteTerceirizado= 1;
                                    $total = consultaStatusClienteTercerizado($clienteTerceirizado,$cod_usuario,$status);
                                    echo '<a href="../ordem/ordem.php?status=2"' . $total['0']['total'] . '" style="color: #f6c23e;">' . $total['0']['total'] . '</a>';
                                }
                                if ($_SESSION['perfil'] == 3) {
                                    $cod_usuario = $_SESSION['cod_usu'];
                                    $status = 2;
                                    $clienteTerceirizado= 0;
                                    $total = consultaStatusClienteTercerizado($clienteTerceirizado,$cod_usuario,$status);
                                    echo '<a href="../ordem/ordem.php?status=2"' . $total['0']['total'] . '" style="color: #f6c23e;">' . $total['0']['total'] . '</a>';
                                }
                            ?>  
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-briefcase fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-xl-3 col-md-6 mb-4" id="cards-notice">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                            Ordens de Serviço Concluídas</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                <?php
                                if ($_SESSION['perfil'] == 1) {
                                    $status = 3;
                                    $total = consultaStatusUsuario($status);
                                    echo '<a href="../ordem/ordem.php?status=3"' . $total['0']['total'] . '" style="color:#36b9cc;">' . $total['0']['total'] . '</a>';
                                }
                                if ($_SESSION['perfil'] == 2) {
                                    $cod_usuario = $_SESSION['cod_usu'];
                                    $status = 3;
                                    $clienteTerceirizado= 1;
                                    $total = consultaStatusClienteTercerizado($clienteTerceirizado,$cod_usuario,$status);
                                    echo '<a href="../ordem/ordem.php?status=3"' . $total['0']['total'] . '" style="color:#36b9cc;">' . $total['0']['total'] . '</a>';
                                }
                                if ($_SESSION['perfil'] == 3) {
                                    $cod_usuario = $_SESSION['cod_usu'];
                                    $status = 3;
                                    $clienteTerceirizado= 0;
                                    $total = consultaStatusClienteTercerizado($clienteTerceirizado,$cod_usuario,$status);
                                    echo '<a href="../ordem/ordem.php?status=3"' . $total['0']['total'] . '" style="color:#36b9cc;">' . $total['0']['total'] . '</a>';
                                }
                            ?>  
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>


</div>
<!-- /.container-fluid -->

</div>


<?php
require_once('../layout/footer.php');
?>