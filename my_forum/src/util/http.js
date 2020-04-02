import axios from 'axios'
import cookie from 'js-cookie'


function http(options){
        let defaultOption = {
                method: 'POST',
                headers: {
                        'Authorization': cookie.get('token'),
                }
        };
        options = Object.assign({}, defaultOption, options);
        return axios(options).then((response,rej) =>{
                // console.log(response);
                if(response.status === 200){
                        return response.data;
                }else{
                        return new Error(response.statusText)
                }
        }).then(res =>{
                switch(res.status){
                    case 199:
                                return res;
                                break;
                        case 200:
                                return res;
                                break;
                        case 401:
                                this.$router.push('/login');
                                break;
                }
        })
}

export default http;
