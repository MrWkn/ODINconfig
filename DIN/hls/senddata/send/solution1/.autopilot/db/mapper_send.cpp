#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
extern "C" int send(int*, int, volatile void *, volatile void *, volatile void *, int, volatile void *, volatile void *);
extern "C" int apatb_send_hw(volatile void * __xlx_apatb_param_data_ptr, volatile void * __xlx_apatb_param_data, volatile void * __xlx_apatb_param_req, volatile void * __xlx_apatb_param_ack, int __xlx_apatb_param_read_loc, volatile void * __xlx_apatb_param_SCHED_FULL, volatile void * __xlx_apatb_param_NEUR_EVENT_OUT) {
  // Collect __xlx_data_ptr__tmp_vec
  vector<sc_bv<32> >__xlx_data_ptr__tmp_vec;
  for (int j = 0, e = 100; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_data_ptr)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_data_ptr)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_data_ptr)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_data_ptr)[j*4+3];
    __xlx_data_ptr__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_data_ptr = 100;
  int __xlx_offset_param_data_ptr = 0;
  int __xlx_offset_byte_param_data_ptr = 0*4;
  int* __xlx_data_ptr__input_buffer= new int[__xlx_data_ptr__tmp_vec.size()];
  for (int i = 0; i < __xlx_data_ptr__tmp_vec.size(); ++i) {
    __xlx_data_ptr__input_buffer[i] = __xlx_data_ptr__tmp_vec[i].range(31, 0).to_uint64();
  }
  // DUT call
  int ap_return = send(__xlx_data_ptr__input_buffer, __xlx_offset_byte_param_data_ptr, __xlx_apatb_param_data, __xlx_apatb_param_req, __xlx_apatb_param_ack, __xlx_apatb_param_read_loc, __xlx_apatb_param_SCHED_FULL, __xlx_apatb_param_NEUR_EVENT_OUT);
// print __xlx_apatb_param_data_ptr
  sc_bv<32>*__xlx_data_ptr_output_buffer = new sc_bv<32>[__xlx_size_param_data_ptr];
  for (int i = 0; i < __xlx_size_param_data_ptr; ++i) {
    __xlx_data_ptr_output_buffer[i] = __xlx_data_ptr__input_buffer[i+__xlx_offset_param_data_ptr];
  }
  for (int i = 0; i < __xlx_size_param_data_ptr; ++i) {
    ((char*)__xlx_apatb_param_data_ptr)[i*4+0] = __xlx_data_ptr_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_data_ptr)[i*4+1] = __xlx_data_ptr_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_data_ptr)[i*4+2] = __xlx_data_ptr_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_data_ptr)[i*4+3] = __xlx_data_ptr_output_buffer[i].range(31, 24).to_uint();
  }
return ap_return;
}
