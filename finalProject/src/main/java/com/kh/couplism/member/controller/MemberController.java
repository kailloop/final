package com.kh.couplism.member.controller;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.couplism.email.MailAuth;
import com.kh.couplism.member.model.service.MemberService;
import com.kh.couplism.member.model.vo.Member;

@Controller
@SessionAttributes(value= {"logginedMember","member"})
public class MemberController {
	
	@Autowired
	private MemberService service;
	
//	@Autowired
//	private BCryptPasswordEncoder encoder;
	
	@RequestMapping("/enrollMember.do")
	public ModelAndView enrollMember(ModelAndView mv) {
		
		//사진
		mv.addObject("logoPath","/resources/images/home-logo2.jpg");
		//한글 타이틀
		mv.addObject("titleHan","회원가입");
		//영어 타이틀
		mv.addObject("titleEng","Join Member or Partner");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				);

		mv.setViewName("member/memberEnroll");
		
		return mv;
	}
	
	@RequestMapping(value="/member/memberEnrollEnd",method=RequestMethod.POST)
	public String memberEnrollEnd(Member member,Model m) {
		
//		String encodePw=encoder.encode(member.getPassword());
//		
//		member.setPassword(encodePw);
		System.out.println("memberEnrollEnd들어와짐 ");
		System.out.println(member);
		int result=service.enrollMember(member);
		System.out.println(result);
		String msg="";
		String loc="";
		
		if(result>0) {
			msg="회원가입에 성공하셨습니다!";
			loc="/";
		}else {
			msg="회원가입실패하였습니다. 관리자에게 문의해주세요.";
			loc="/enrollMember.do";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		System.out.println("마지막줄");
		return "common/msg";
	}
	@RequestMapping("/member/checkEmail")
	@ResponseBody
	public String emailCheck(@RequestParam (value="email",required=false,defaultValue="kailloop@daum.net")String email,
										HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		
		Properties prop=System.getProperties();
		
		prop.put("mail.smtp.host","smtp.naver.com");
		prop.put("mail.smtp.port",465);
		prop.put("mail.smtp.auth","true");
		prop.put("mail.smtp.ssl.enable","true");
		prop.put("mail.smtp.ssl.trust","smtp.naver.com");
		prop.put("mail.transport.protocol","smtp" );
		
		//Session
		MailAuth auth=new MailAuth();
		Session session = Session.getDefaultInstance(prop,auth);
		String emailNumber = null;
		try {
			MimeMessage message = new MimeMessage(session);
			
			int emailNum=(int)(Math.random()*999999);
			
			//송신자
			message.setFrom(new InternetAddress("couplism@naver.com","COUPLISM"));
			
			//수신자
			InternetAddress to = new InternetAddress(email);
			
			message.setRecipient(Message.RecipientType.TO, to);
			message.setSubject("커플리즘 이메일 인증","UTF-8");
			message.setText("안녕하세요 커플리즘 이메일 인증번호입니다."
					+ "\n인증번호 :"+ emailNum
					+ "\n인증번호를 회원가입하시는 창 이메일 인증 칸안에 적어주세요.","UTF-8");
			
			Transport.send(message);
			System.out.println("message 보내기 성공");
			emailNumber=String.valueOf(emailNum);
		}catch(AddressException ae) {
			System.out.println("AddressException : "+ae);
		}catch(MessagingException me) {
			System.out.println("MessageException : "+me.getMessage());
		}catch(UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException : "+e.getMessage());
		}finally {
			System.out.println("try 문장 실행 check");
		}
		System.out.println(emailNumber);
		
		return emailNumber;
	}
}
