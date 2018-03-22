package kobay.com.cmmn;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kobay.com.service.MemberVO;

public class MemberVaildator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberVO.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object obj, Errors errors) {
		MemberVO member = (MemberVO) obj;
		
		//아이디 체크
		String mId = member.getMemberId();
		boolean check = Pattern.matches("^[a-zA-Z0-9]+@[a-z]+\\.[a-z]+$", mId);
		if(!check) {
			errors.rejectValue("memberId","email","유효한 이메일이 아닙니다.");
			System.out.println("이메일 정규식 에러");
		}
		
		//비밀번호 체크
		String mPwd = member.getMemberPwd();
		check = Pattern.matches("^[a-zA-Z0-9]+$", mPwd);
		if(!check || mPwd.length() < 8) {
			errors.rejectValue("memberPwd","pwd","유효한 비밀번호가 아닙니다.");
			System.out.println("비밀번호 정규식 에러");
		}
		
		//이름 체크
		String mName = member.getMemberName();
		boolean check1 = Pattern.matches("^[a-zA-Z]+$", mName);
		boolean check2 = Pattern.matches("^[가-힣]+$", mName);
		if(!check1 && !check2) {
			errors.rejectValue("memberName","name","유효한 이름이 아닙니다.");
			System.out.println("이름 정규식 에러");
		}
		
		//핸드폰 번호 체크
		String mPhone = member.getMemberPhone();
		check = Pattern.matches("^01[0-9]-[0-9]{3,4}-[0-9]{4}$", mPhone);
		if(!check) {
			errors.rejectValue("memberPhone","phonenumber","유효한 핸드폰 번호가 아닙니다.");
			System.out.println("핸드폰 번호 정규식 에러");
		}
	}

}
