package cn.edu.nyist.food.front.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.nyist.food.common.ValidateController;
import cn.edu.nyist.food.front.service.BuyerInfoService;
import cn.edu.nyist.food.model.BuyerInfo;

@Controller
@RequestMapping("/front")
public class RegController {
	/*
	 * 由于注册和登录在一个界面，不用这儿转去注册界面
	 */
	@Autowired
	private BuyerInfoService buyerInfoService;


	@RequestMapping("/reg")
	public String reg(@RequestParam String name, @RequestParam String secondpwd, @RequestParam String pwd,
			@RequestParam String vcode, HttpServletRequest request) {
		/*
		 * 用户注册判断 1.二次密码是否相同 2.验证码是否正确 3.用户名是否被注册
		 */
		// 服务器的验证
		// 判断二次密码是否相同
		if (!pwd.equals(secondpwd)) {
			request.setAttribute("regmsg", "两次输入的密码不符");
			request.setAttribute("name", name);
			return "/front/login";
		}
		String serverVcode = (String) request.getSession().getAttribute(ValidateController.SERVER_VCODE);
		System.out.println(serverVcode+"-----------------------");
		// 验证码是否正确
		if (!vcode.equalsIgnoreCase(serverVcode)) {
			request.setAttribute("regmsg", "验证码不正确");
			request.setAttribute("name", name);
			return "/front/login";
		}
		// 用户名是否被注册
		BuyerInfo buyer = buyerInfoService.findBuyerByName(name);
		if (buyer == null) {
			BuyerInfo buyerInfo = new BuyerInfo();
			buyerInfo.setBuyerName(name);
			buyerInfo.setBuyerPwd(pwd);

			BuyerInfo buyerInfo2 = buyerInfoService.saveBuyer(buyerInfo);
			if (buyerInfo2 != null) {

				request.setAttribute("regmsg", "注册成功");
				return "/front/login";
			} else {
				request.setAttribute("regmsg", "注册失败");
				request.setAttribute("name", name);
			}

		} else {
			request.setAttribute("msg", "用户名已存在");
			request.setAttribute("name", name);
		}
		return "/front/login";
	}
}
