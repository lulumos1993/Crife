package com.crowd.funding.member.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.crowd.funding.member.MailHandler;
import com.crowd.funding.member.TempKey;
import com.crowd.funding.member.model.LoginDTO;
import com.crowd.funding.member.model.MemberDAO;
import com.crowd.funding.member.model.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO memDAO;
	@Inject
	private JavaMailSender mailSender;

	@Override
	public MemberDTO snsLogin(MemberDTO mem) throws Exception {
		System.out.println("##### memberService : snsLogin #####");
		return memDAO.snsLogin(mem);
	}

	@Override
	public void snsjoinPOST(MemberDTO memDTO, Date registertime) throws Exception {
		System.out.println("##### memberService : joinPOST #####");
		memDAO.snsjoinPOST(memDTO, registertime);
	}

	@Override
	public void joinPOST(MemberDTO memDTO, Date registertime) throws Exception {
		System.out.println("##### memberService : joinPOST #####");
		memDAO.joinPOST(memDTO, registertime);

		// 인증키 생성
		String email_key = new TempKey().getKey(50, false);
		memDAO.creatKey(memDTO.getMem_email(), email_key);

		// eamil 발송
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[이메일 인증]");
		sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>")
				.append("<a href='http://localhost:8080/funding/user/emailConfirm?mem_email=" + memDTO.getMem_email())
				.append("&email_key=" + email_key + "' target='_blank'>이메일 인증</a>").toString());
														//_blank : 새 윈도우 창을 열어서, 웹페이지를 엽니다. 
		sendMail.setFrom("lulumos1993@gmail.com", "페퍼민트");
		sendMail.setTo(memDTO.getMem_email());
		sendMail.send();

		System.out.println("----------------email_key : " + email_key);
	}

	@Override
	public int chkKey(String mem_email, int email_type) throws Exception {

		return memDAO.chkKey(mem_email, email_type);
	}

	@Override
	public void emailAuth(String mem_email, String email_key) throws Exception {
		memDAO.emailAuth(mem_email, email_key);

	}

	@Override
	public MemberDTO loginPOST(LoginDTO logDTO) throws Exception {
		System.out.println("##### memberService : loginPOST #####");

		return memDAO.loginPOST(logDTO);
	}

	@Override
	public void lastLogin(String mem_email, Date lastLogin) throws Exception {
		System.out.println("##### memberService : lastLogin #####");
		memDAO.lastLogin(mem_email, lastLogin);
	}

	@Override
	public void keepLogin(String mem_email, String sessionid, Date sessionlimit) throws Exception {
		System.out.println("##### memberService : keepLogin #####");
		memDAO.keepLogin(mem_email, sessionid, sessionlimit);

	}

	@Override
	public MemberDTO checkSessionKey(String value) throws Exception {
		System.out.println("##### memberService : checkSessionKey #####");
		return memDAO.checkSessionKey(value);
	}

	@Override
	public MemberDTO myinfo(int mem_idx) throws Exception {
		System.out.println("##### memberService : myinfo #####");
		return memDAO.myinfo(mem_idx);
	}

	@Override
	public void myinfoUP(MemberDTO memDTO) throws Exception {
		System.out.println("##### memberService : myinfoUP #####");
		memDAO.myinfoUP(memDTO);
	}

	@Override
	public void myinfoDEL(int mem_idx) throws Exception {
		System.out.println("##### memberService : myinfoDEL #####");
		memDAO.myinfoDEL(mem_idx);
	}

	@Override
	public int statusPro(int mem_idx) {
		
		return memDAO.statusPro(mem_idx);
	}

	@Override
	public int userfindID(String find) throws Exception {
		System.out.println("##### memberService : userfindID #####");
		return memDAO.userfindID(find);
	}

	@Override
	public void userfindPW(String find) throws Exception {

		// 인증키 생성
		String email_key = new TempKey().getKey(50, false);
		memDAO.userfindPW(find, email_key);

		// eamil 발송
		MailHandler sendMail = new MailHandler(mailSender);
		StringBuffer r = new StringBuffer();
		sendMail.setSubject("[비밀번호 재설정 안내]");
		sendMail.setText(r.append("<h1>비밀번호 변경</h1>")
				.append("<a href='http://localhost:8080/funding/user/resetpw?mem_email=" + find)
				.append("&email_key=" + email_key + "' target='_blank'>비밀번호 변경</a>").append(" 어디로 붙을까?").append("\n") // 안됨
				.append("a").append(System.getProperty("line.separator")) // 안됨
				.append("b").toString());
		sendMail.setFrom("lulumos1993@gmail.com", "페퍼민트");
		sendMail.setTo(find);
		sendMail.send();

		System.out.println("메일발송 완료");

	}

	@Override
	public void resetPW(String mem_password, String mem_email, String email_key) throws Exception {
		memDAO.resetPW(mem_password, mem_email, email_key);
	}

	@Override
	public MemberDTO memchk_lastlogin(MemberDTO mem) throws Exception {
		
						
		return memDAO.memchk_lastlogin(mem);
	}
	
	
	
	
	
	
	
	

}
