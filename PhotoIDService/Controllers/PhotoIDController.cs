using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using PhotoIDService.Models;
using PhotoIDService.Services;
using System;
using System.Data.SqlClient;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace PhotoIDService.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PhotoIDController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        public PhotoIDController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        // GET: api/<DemografiController>
        [HttpGet]
        //[Authorize]
        //[Route("GetAllDemografi")]
        public ResponsePhotoID Get()
        {
            SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DbConnection").ToString());
            ResponsePhotoID ResponsePhotoID = new ResponsePhotoID();
            IPhotoID IPhotoID = new IPhotoID();

            try
            {
                ResponsePhotoID = IPhotoID.GetPhotoID(connection);
            }
            catch (Exception ex)
            {
                ResponsePhotoID.MsgCode = 500;
                ResponsePhotoID.MsgInfo = "Internal Server Error";
            }

            return ResponsePhotoID;
        }

        // GET api/<DemografiController>/5
        [HttpGet("{Id}")]
        //[Authorize]
        //[Route("GetDemografiById")]
        public ResponsePhotoID Get(int Id)
        {
            SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DbConnection").ToString());
            ResponsePhotoID ResponsePhotoID = new ResponsePhotoID();
            IPhotoID IPhotoID = new IPhotoID();

            try
            {
                ResponsePhotoID = IPhotoID.GetPhotoIDById(connection, Id);
            }
            catch (Exception ex)
            {
                ResponsePhotoID.MsgCode = 500;
                ResponsePhotoID.MsgInfo = "Internal Server Error";
            }

            return ResponsePhotoID;
        }

        // POST api/<DemografiController>
        [HttpPost]
        //[Authorize(Roles = "Administrator")]
        //[Route("InsertDemografi")]
        public ResponsePhotoID Post([FromBody] RequestPhotoID insertPhotoID)
        {
            SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DbConnection").ToString());
            ResponsePhotoID ResponsePhotoID = new ResponsePhotoID();
            IPhotoID IPhotoID = new IPhotoID();
            

            try
            {
                ResponsePhotoID = IPhotoID.InsertPhotoID(connection, insertPhotoID);
            }
            catch (Exception ex)
            {
                ResponsePhotoID.MsgCode = 500;
                ResponsePhotoID.MsgInfo = "Internal Server Error";
            }

            return ResponsePhotoID;
        }

        // PUT api/<DemografiController>/5
        [HttpPut]
        //[Authorize(Roles = "Administrator")]
        public ResponsePhotoID Put([FromBody] PhotoID updatePhotoID)
        {
            SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DbConnection").ToString());
            ResponsePhotoID ResponsePhotoID = new ResponsePhotoID();
            IPhotoID IPhotoID = new IPhotoID();
            
            try
            {
                ResponsePhotoID = IPhotoID.UpdatePhotoID(connection, updatePhotoID);
            }
            catch (Exception ex)
            {
                ResponsePhotoID.MsgCode = 500;
                ResponsePhotoID.MsgInfo = "Internal Server Error";
            }

            return ResponsePhotoID;
        }

        // DELETE api/<DemografiController>/5
        [HttpDelete("{Id}")]
        //[Authorize(Roles = "Administrator")]
        public ResponsePhotoID Delete(int Id)
        {
            SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DbConnection").ToString());
            ResponsePhotoID ResponsePhotoID = new ResponsePhotoID();
            IPhotoID IPhotoID = new IPhotoID();

            try
            {
                ResponsePhotoID = IPhotoID.DeletePhotoID(connection, Id);
            }
            catch (Exception ex)
            {
                ResponsePhotoID.MsgCode = 500;
                ResponsePhotoID.MsgInfo = "Internal Server Error";
            }

            return ResponsePhotoID;
        }
    }
}
