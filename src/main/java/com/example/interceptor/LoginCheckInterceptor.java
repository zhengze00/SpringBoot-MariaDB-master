package com.example.interceptor;

import com.alibaba.fastjson.JSONObject;
import com.example.pojo.Result;
import com.example.utils.JwtUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;

import java.util.Map;

@Slf4j
@Component
public class LoginCheckInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
        log.info("Enter interceptor");
        //获得请求头里的token  Get the token in the request header
        String jwt = req.getHeader("token");

        //判断token是否为空  Determine whether the token is empty
        if(!StringUtils.hasLength(jwt)){
            log.info("request header token is empty");
            String notLogin = JSONObject.toJSONString(Result.error("not login"));
            resp.getWriter().write(notLogin);
            return false;
        }
        //尝试解析jwt  Try to parse jwt
        try{
            Map<String,Object> jwtMap = JwtUtils.parseJWT(jwt);
            String user_nm = (String)jwtMap.get("user_nm");
            log.info("userid in jwt:{}",user_nm);
//            log.info("jwt         :"+jwt);
//            log.info("jwt in redis:"+redisTemplate.opsForValue().get(userId));
            req.setAttribute("user_nm",user_nm);


        }catch (Exception e){
//            log.info("Exception: "+e.getMessage());
            e.printStackTrace();

            log.info("Failed to parse token, not login");
            String notLogin = JSONObject.toJSONString(Result.error("not login"));
            resp.getWriter().write(notLogin);
            return false;

        }
        //放行  release
        log.info("Token qualified");
        return true;
    }
}
