<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Management</title>
        <jsp:include page="../index/AdminHeader.jsp" />
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>
            body {
                margin-top: 10px;
                background: #f8f8f8;
            }

            thead th{
                top: 0;
                position: sticky;
                z-index: 20;
            }

            th, td{
                outline: 0.6px solid #DEE2E6;
                background: white;
            }

            .col-check{
                left: 0px;
                position: sticky;
            }

            .col-id{
                left: 65px;
                position: sticky;
            }

            .col-name{
                left: 141px;
                position: sticky;
            }

            .fixed-header{
                z-index: 50;
            }
        </style>
    </head>

    <body scroll="no">
        <div class="container">
            <div class="col-10">
            <h2 class="tm-block-title d-inline-block text-success mt-5">User Management</h2>
        </div>
        <div class="container mt-5 mb-5">
            <div class="row flex-lg-nowrap">
                <div class="col">
                    <div class="e-tabs mb-3 px-3">
                        <ul class="nav nav-tabs">
                            <li class="nav-item"><a class="nav-link active" href="#">Users</a></li>
                        </ul>
                    </div>

                    <div class="row flex-lg-nowrap">
                        <div class="col mb-3">
                            <div class="e-panel card">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h6 class="mr-2"><span>Users</span><small class="px-1">Be a wise leader</small></h6>
                                    </div>
                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th class="align-middle col-check fixed-header">
                                                            <div style="min-width: 40px;width: 40px"
                                                                 class="custom-control custom-control-inline custom-checkbox custom-control-nameless m-0">
                                                                <input type="checkbox" class="custom-control-input" id="all-items">
                                                                <label class="custom-control-label" for="all-items">All</label>
                                                            </div>
                                                        </th>
                                                        <th style="min-width: 75px;width: 75px" class ="sortable align-middle col-id fixed-header">UserID</th>
                                                        <th style="min-width: 225px;width: 225px" class="max-width align-middle col-name fixed-header">Name</th>
                                                        <th>Photo</th>
                                                        <th class="sortable max-width">Date of Birth</th>
                                                        <th class="max-width">Phone No</th>
                                                        <th class="max-width">Address</th>
                                                        <th class="max-width">Email</th>
                                                        <th class="max-width">Password</th>
                                                        <th>Weight</th>
                                                        <th>Height</th>
                                                        <th>Gender</th>
                                                        <th>Activity</th>
                                                        <th>Preference</th>
                                                        <th>Goal</th>
                                                        <th>Amount of Change</th>
                                                        <th>Duration</th>
                                                        <th>Main Meals</th>
                                                        <th>Side Meals</th>
                                                        <th>Exercise Session</th>
                                                        <th>Rank</th>
                                                        <th>Create Date</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${userList}" var="x">
                                                        <tr>
                                                            <td class="align-middle col-check">
                                                                <div class="custom-control custom-control-inline custom-checkbox custom-control-nameless m-0 align-top">
                                                                    <input type="checkbox" class="custom-control-input" id="item-1" name='checkbox' value='${x.getUserID()}'>
                                                                    <label class="custom-control-label" for="item-1"></label>
                                                                </div>
                                                            </td>
                                                            <td class="text-center align-middle col-id">${x.getUserID()}</td>
                                                            <td class="text-nowrap align-middle col-name">${x.getUsername()}</td>
                                                            <td class="align-middle text-center">
                                                                <div
                                                                    class="bg-light d-inline-flex justify-content-center align-items-center align-top"
                                                                    style="width: 35px; height: 35px; border-radius: 3px;"><i
                                                                        class="fa fa-fw fa-photo" style="opacity: 0.8;"></i></div>
                                                            </td>
                                                            <td class="text-nowrap align-middle"><span>${x.getDob()}</span></td>
                                                            <td class="text-center align-middle">${x.getPhone()}</td>
                                                            <td class="text-center align-middle"><span>${x.getAddress()}</span></td>
                                                            <td class="text-center align-middle">${x.getEmail()}</td>
                                                            <td class="text-center align-middle">${x.getPassword()}</td>
                                                            <td class="text-center align-middle">${x.getWeight()}</td>
                                                            <td class="text-center align-middle">${x.getHeight()}</td>
                                                            <td class="text-center align-middle">${x.getGender()}</td>
                                                            <td class="text-center align-middle">${x.getActivity()}</td>
                                                            <td class="text-center align-middle">${x.getPreference()}</td>
                                                            <td class="text-center align-middle">${x.getGoal()}</td>
                                                            <td class="text-center align-middle">${x.getAmount()}</td>
                                                            <td class="text-center align-middle">${x.getDuration()}</td>
                                                            <td class="text-center align-middle">${x.getMain()}</td>
                                                            <td class="text-center align-middle">${x.getSide()}</td>
                                                            <td class="text-center align-middle">${x.getSession()}</td>
                                                            <td class="text-center align-middle">${x.getRank()}</td>
                                                            <td class="text-center align-middle"><span>${x.getCreatedate()}</span></td>
                                                            <td class="text-center align-middle">
                                                                <a href='UserController?action=update&userID=${x.getUserID()}'><button class="btn btn-sm btn-outline-secondary badge" type="button"
                                                                                                                                       data-toggle="modal" data-target="#user-form-modal">Edit</button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="d-flex justify-content-center mb-5">
                                            <ul class="pagination mt-3 mb-0">
                                                <li class="disabled page-item"><a href="#" class="page-link">&#8249;</a></li>
                                                <li class="active page-item"><a href="#" class="page-link">1</a></li>
                                                <li class="page-item"><a href="#" class="page-link">2</a></li>
                                                <li class="page-item"><a href="#" class="page-link">3</a></li>
                                                <li class="page-item"><a href="#" class="page-link">4</a></li>
                                                <li class="page-item"><a href="#" class="page-link">5</a></li>
                                                <li class="page-item"><a href="#" class="page-link">&#8250;</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <a
                                        href="AddUser.jsp"
                                        class="btn btn-primary btn-block text-uppercase mb-3 bg-success">Add new User</a>
                                    <button class="btn btn-primary btn-block text-uppercase bg-success">
                                        Delete selected User
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
        </div>


        
        
        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <jsp:include page="../index/UserFooter.jsp" />
    </body>

</html>