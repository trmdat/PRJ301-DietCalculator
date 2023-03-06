<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>User Management</title>
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
   <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
   <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <style>
      body {
         margin-top: 20px;
         background: #f8f8f8;
         overflow: hidden;
         padding-right: 15em;
      }
      
      thead th{
          top: 0;
          position: sticky;
          z-index: 20;
      }
      
      th, td{
          outline: 0.5px solid #DEE2E6;
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
          left: 144px;
          position: sticky;
      }
      
      .fixed-header{
          z-index: 50;
      }
   </style>
</head>

<body scroll="no">
   <div class="container">
      <div class="row flex-lg-nowrap">
<!--          <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
            <div class="card p-3">
               <div class="e-navlist e-navlist--active-bg">
                  <ul class="nav">
                     <li class="nav-item"><a class="nav-link px-2 active" href="#"><i
                              class="fa fa-fw fa-bar-chart mr-1"></i><span>Overview</span></a></li>
                     <li class="nav-item"><a class="nav-link px-2"
                           href="https://www.bootdey.com/snippets/view/bs4-crud-users" target="__blank"><i
                              class="fa fa-fw fa-th mr-1"></i><span>CRUD</span></a></li>
                     <li class="nav-item"><a class="nav-link px-2"
                           href="https://www.bootdey.com/snippets/view/bs4-edit-profile-page" target="__blank"><i
                              class="fa fa-fw fa-cog mr-1"></i><span>Settings</span></a></li>
                  </ul>
               </div>
            </div>
         </div> -->

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
                                     <c:forEach ietms="${userList}" var="x">
                                        <tr>
                                           <td class="align-middle col-check">
                                              <div
                                                 class="custom-control custom-control-inline custom-checkbox custom-control-nameless m-0 align-top">
                                                 <input type="checkbox" class="custom-control-input" id="item-1">
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
                                                 <button class="btn btn-sm btn-outline-secondary badge" type="button"
                                                    data-toggle="modal" data-target="#user-form-modal">Edit</button>
                                           </td>
                                        </tr>
                                     </c:forEach>
                                 </tbody>
                              </table>
                           </div>
                           <div class="d-flex justify-content-center">
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
                        href="AddProduct.html"
                        class="btn btn-primary btn-block text-uppercase mb-3 bg-success">Add new product</a>
                      <button class="btn btn-primary btn-block text-uppercase bg-success">
                        Delete selected products
                      </button>
                     </div>
                  </div>
               </div>
               <div class="col-12 col-lg-3 mb-3">
                  <div class="card">
                     <div class="card-body">
                        <div class="text-center px-xl-3">
                           <h3>Filters</h3>
                        </div>
                        <hr class="my-3">
                        <div class="e-navlist e-navlist--active-bold">
                           <ul class="nav">
                              <li class="nav-item active"><a href=""
                                    class="nav-link"><span>All</span>&nbsp;<small>/&nbsp;32</small></a></li>
                              <li class="nav-item"><a href=""
                                    class="nav-link"><span>Active</span>&nbsp;<small>/&nbsp;16</small></a></li>
                              <li class="nav-item"><a href=""
                                    class="nav-link"><span>Selected</span>&nbsp;<small>/&nbsp;0</small></a></li>
                           </ul>
                        </div>
                        <hr class="my-3">
                        <div>
                           <div class="form-group">
                              <label>Date from - to:</label>
                              <div>
                                 <input id="dates-range" class="form-control flatpickr-input"
                                    placeholder="01 Dec 17 - 27 Jan 18" type="text" readonly="readonly">
                              </div>
                           </div>
                           <div class="form-group">
                              <label>Search by Name:</label>
                              <div><input class="form-control w-100" type="text" placeholder="Name" value=""></div>
                           </div>
                        </div>
                        <hr class="my-3">
                        <div class="">
                           <label>Status:</label>
                           <div class="px-2">
                              <div class="custom-control custom-radio">
                                 <input type="radio" class="custom-control-input" name="user-status"
                                    id="users-status-disabled">
                                 <label class="custom-control-label" for="users-status-disabled">Disabled</label>
                              </div>
                           </div>
                           <div class="px-2">
                              <div class="custom-control custom-radio">
                                 <input type="radio" class="custom-control-input" name="user-status"
                                    id="users-status-active">
                                 <label class="custom-control-label" for="users-status-active">Active</label>
                              </div>
                           </div>
                           <div class="px-2">
                              <div class="custom-control custom-radio">
                                 <input type="radio" class="custom-control-input" name="user-status"
                                    id="users-status-any" checked="">
                                 <label class="custom-control-label" for="users-status-any">Any</label>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>

            <!-- User Form Modal -->
            <div class="modal fade" role="dialog" tabindex="-1" id="user-form-modal">
               <div class="modal-dialog modal-lg" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title">Create User</h5>
                        <button type="button" class="close" data-dismiss="modal">
                           <span aria-hidden="true">×</span>
                        </button>
                     </div>
                     <div class="modal-body">
                        <div class="py-1">
                           <form class="form" novalidate="">
                              <div class="row">
                                 <div class="col">
                                    <div class="row">
                                       <div class="col">
                                          <div class="form-group">
                                             <label>Full Name</label>
                                             <input class="form-control" type="text" name="name"
                                                placeholder="John Smith" value="John Smith">
                                          </div>
                                       </div>
                                       <div class="col">
                                          <div class="form-group">
                                             <label>Username</label>
                                             <input class="form-control" type="text" name="username"
                                                placeholder="johnny.s" value="johnny.s">
                                          </div>
                                       </div>
                                    </div>
                                    <div class="row">
                                       <div class="col">
                                          <div class="form-group">
                                             <label>Email</label>
                                             <input class="form-control" type="text" placeholder="user@example.com">
                                          </div>
                                       </div>
                                    </div>
                                    <div class="row">
                                       <div class="col mb-3">
                                          <div class="form-group">
                                             <label>About</label>
                                             <textarea class="form-control" rows="5" placeholder="My Bio"></textarea>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="row">
                                 <div class="col-12 col-sm-6 mb-3">
                                    <div class="mb-2"><b>Change Password</b></div>
                                    <div class="row">
                                       <div class="col">
                                          <div class="form-group">
                                             <label>Current Password</label>
                                             <input class="form-control" type="password" placeholder="••••••">
                                          </div>
                                       </div>
                                    </div>
                                    <div class="row">
                                       <div class="col">
                                          <div class="form-group">
                                             <label>New Password</label>
                                             <input class="form-control" type="password" placeholder="••••••">
                                          </div>
                                       </div>
                                       <div class="col">
                                          <div class="form-group">
                                             <label>Confirm <span class="d-none d-xl-inline">Password</span></label>
                                             <input class="form-control" type="password" placeholder="••••••">
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col-12 col-sm-5 offset-sm-1 mb-3">
                                    <div class="mb-2"><b>Keeping in Touch</b></div>
                                    <div class="row">
                                       <div class="col">
                                          <label>Email Notifications</label>
                                          <div class="custom-controls-stacked px-2">
                                             <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input"
                                                   id="notifications-blog" checked="">
                                                <label class="custom-control-label" for="notifications-blog">Blog
                                                   posts</label>
                                             </div>
                                             <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input"
                                                   id="notifications-news" checked="">
                                                <label class="custom-control-label"
                                                   for="notifications-news">Newsletter</label>
                                             </div>
                                             <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input"
                                                   id="notifications-offers" checked="">
                                                <label class="custom-control-label" for="notifications-offers">Personal
                                                   Offers</label>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="row">
                                 <div class="col d-flex justify-content-end">
                                    <button class="btn btn-primary" type="submit">Save Changes</button>
                                 </div>
                              </div>
                           </form>

                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <script src="js/jquery-3.3.1.min.js"></script>
   <!-- https://jquery.com/download/ -->
   <script src="js/bootstrap.min.js"></script>
   <!-- https://getbootstrap.com/ -->
</body>

</html>